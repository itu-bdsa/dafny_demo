using System.Numerics;
using Native;

var box = new Box(-4);
Console.WriteLine(AbsBox.__default.AbsField(box));    // 4
Console.WriteLine(AbsBox.__default.AbsGetter(box));   // 4
