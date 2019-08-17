import 'package:abstract_dart/abstract_dart.dart';
import 'package:decimal/decimal.dart';

class BigIntSumGroup with GroupOps<BigInt> {
  const BigIntSumGroup();

  @override
  BigInt identity() => BigInt.zero;

  @override
  BigInt operate(BigInt a, BigInt b) => a + b;

  @override
  BigInt inverse(BigInt a, BigInt b) => a - b;
}

class DecimalProductGroup with GroupOps<Decimal> {
  const DecimalProductGroup();

  @override
  Decimal identity() => Decimal.one;

  @override
  Decimal operate(Decimal a, Decimal b) => a * b;

  @override
  Decimal inverse(Decimal a, Decimal b) {
    if (b == Decimal.zero) ArgumentError("b can't be 0");
    return a / b;
  }
}

class DecimalSumGroup with GroupOps<Decimal> {
  const DecimalSumGroup();

  @override
  Decimal identity() => Decimal.zero;

  @override
  Decimal operate(Decimal a, Decimal b) => a + b;

  @override
  Decimal inverse(Decimal a, Decimal b) => a - b;
}

// unsafe
class DoubleProductGroup with GroupOps<double> {
  const DoubleProductGroup();

  @override
  double identity() => 1.0;

  @override
  double operate(double a, double b) => a * b;

  @override
  double inverse(double a, double b) {
    if (b == 0.0) ArgumentError("b can't be 0");
    return a / b;
  }
}

// unsafe
class DoubleSumGroup with GroupOps<double> {
  const DoubleSumGroup();

  @override
  double identity() => 0;

  @override
  double operate(double a, double b) => a + b;

  @override
  double inverse(double a, double b) => a - b;
}

// unsafe
class NumProductGroup with GroupOps<num> {
  const NumProductGroup();

  @override
  num identity() => 1.0;

  @override
  num operate(num a, num b) => a * b;

  @override
  num inverse(num a, num b) {
    if (b == 0.0) ArgumentError("b can't be 0");
    return a / b;
  }
}

// unsafe
class NumSumGroup with GroupOps<num> {
  const NumSumGroup();

  @override
  num identity() => 0;

  @override
  num operate(num a, num b) => a + b;

  @override
  num inverse(num a, num b) => a - b;
}
