using System.Numerics;

namespace Native {
  public class Box {
    public BigInteger Value;                         // accessed directly by Dafny
    public Box(BigInteger v) { Value = v; }
    public BigInteger GetValue() { return Value; }   // called by Dafny
  }
}
