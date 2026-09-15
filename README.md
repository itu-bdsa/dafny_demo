# Demo task 4

We will now investigate how to refer to C# code from dafny. To this end, we will pass a boxed integer to the Abs function.
* Check the boxed implementation in `DafnyLib/Box.cs`
* Check the Dafny code in `dafny/AbsBox.dfy`
  *  The first module acts as the Dafny view on C# code, :extern refers to a name in the C# project
  *  Note that we add specifications, like `ensures`, to this module. These specifications are not verified, they are only trusted to hold.
* Run `dotnet dafny audit dafny/AbsBox.dfy` and discuss the output with your neighbours
