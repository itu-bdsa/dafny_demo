using System.Numerics;

BigInteger y = Api.__default.AbsNatChecked(5);
Console.WriteLine(y);                       // 5

try { Api.__default.AbsNatChecked(-1); }
catch (Exception e) { Console.WriteLine($"Rejected: {e.Message}"); }
