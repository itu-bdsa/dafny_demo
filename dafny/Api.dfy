include "Abs.dfy"

module Api {
  import opened AbsLib

  method AbsNatChecked(x: int) returns (y: int)
    ensures y == x
  {
    expect x >= 0, "AbsNat: x must be >= 0";
    y := AbsNat(x);
  }
}
