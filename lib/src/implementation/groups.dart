import 'package:abstract_dart/abstract_dart.dart';
import 'package:decimal/decimal.dart';

class BigIntSumGroup extends BigIntSumMonoid implements Group_<BigInt> {
  const BigIntSumGroup();

  @override
  BigInt inverse(BigInt a, BigInt b) => a - b;
}

class DecimalSumGroup extends DecimalSumMonoid implements Group_<Decimal> {
  const DecimalSumGroup();

  @override
  Decimal inverse(Decimal a, Decimal b) => a - b;
}

/// Note: division by zero throws an [ArgumentError] exception.
class DecimalProductGroup extends DecimalProductMonoid
    implements Group_<Decimal> {
  const DecimalProductGroup();

  @override
  Decimal inverse(Decimal a, Decimal b) => a / b;
}

// unsafe
/// Note: division by zero results in double.infinity.
class DoubleProductGroup extends DoubleProductMonoid implements Group_<double> {
  const DoubleProductGroup();

  @override
  double inverse(double a, double b) => a / b;
}

// unsafe
class DoubleSumGroup extends DoubleSumMonoid implements Group_<double> {
  const DoubleSumGroup();

  @override
  double inverse(double a, double b) => a - b;
}

// unsafe
/// Note: division by zero results in double.infinity.
class NumProductGroup extends NumProductMonoid implements Group_<num> {
  const NumProductGroup();

  @override
  num inverse(num a, num b) => a / b;
}

// unsafe
class NumSumGroup extends NumSumMonoid implements Group_<num> {
  const NumSumGroup();

  @override
  num inverse(num a, num b) => a - b;
}
