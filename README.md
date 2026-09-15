# Demo task 3

The dafny code is already in `./dafny`. Take alook at both files and note the module names.
The dafny code will compile into a library project. Set this up as follows.

```
dotnet new tool-manifest
dotnet tool install dafny
dotnet new classlib -n DafnyLib -f net8.0
rm DafnyLib/Class1.cs
dotnet new console -n App -f net8.0
dotnet add App reference DafnyLib
```

Verification and compilation is run with these commands. Api.dfy refers to Abs.dfy, so we do not need to include it.
```
dotnet dafny verify dafny/Api.dfy
dotnet dafny translate cs --include-runtime dafny/Api.dfy --output DafnyLib/Generated.cs
```

Replace `App/Program.cs` with the following code
```
using System.Numerics;

BigInteger y = Api.__default.AbsNatChecked(5);
Console.WriteLine(y);                       // 5

try { Api.__default.AbsNatChecked(-1); }
catch (Exception e) { Console.WriteLine($"Rejected: {e.Message}"); }
```

We use an extra package to check for forbidden API accesses. Install it via 
```
dotnet add App package Microsoft.CodeAnalysis.BannedApiAnalyzers --version 3.3.4
```
Create a file with the forbidden modules in `App/BannedSymbols.txt`
```
T:AbsLib.__default;Call Dafny code only through the Api module
```
Finally, configure the banned API package to read these symbols, and regard their use as error that end build accesses
```
<Project>
  <ItemGroup>
    <AdditionalFiles Include="BannedSymbols.txt" />
  </ItemGroup>
  <PropertyGroup>
    <WarningsAsErrors>$(WarningsAsErrors);RS0030;CS9057</WarningsAsErrors>
  </PropertyGroup>
</Project>
```

Try `dotnet run --project App`. It should succeed to build and then throw an exception.
If you replace the try block in `Program.cs` with the following, it should fail to build.
```
Console.WriteLine(AbsLib.__default.AbsNat(-1));
```
