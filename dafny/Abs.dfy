module AbsLib {
  method AbsNat(x: int) returns (y: int)
    requires x >= 0
    ensures y == x
  {
    y := x;
  }
}
