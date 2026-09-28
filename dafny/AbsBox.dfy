module {:extern "Native"} NativeLib {
  class {:extern "Box"} Box {
    var {:extern "Value"} value: int

    // Trusted: Dafny cannot check that the C# getter really returns the field
    method {:extern "GetValue"} GetValue() returns (v: int)
      ensures v == value
  }
}

module AbsBox {
  import opened NativeLib

  // Variant 1: direct field access
  method AbsField(b: Box) returns (y: int)
    ensures y >= 0 && (b.value >= 0 ==> y == b.value)
  {
    if b.value < 0 { y := -b.value; } else { y := b.value; }
  }

  // Variant 2: call to the C# getter
  method AbsGetter(b: Box) returns (y: int)
    ensures y >= 0 && (b.value >= 0 ==> y == b.value)
  {
    var v := b.GetValue();
    if v < 0 { y := -v; } else { y := v; }
  }
}
