import 'package:abstract_dart/abstract_dart.dart';
import 'package:decimal/decimal.dart';

// unsafe
class BigIntSumMonoid implements Monoid_<BigInt> {
  const BigIntSumMonoid();

  @override
  BigInt identity() => BigInt.zero;

  @override
  BigInt operate(BigInt a, BigInt b) => a + b;
}

class BigIntProductMonoid implements Monoid_<BigInt> {
  const BigIntProductMonoid();

  @override
  BigInt identity() => BigInt.one;

  @override
  BigInt operate(BigInt a, BigInt b) => a * b;
}

class DecimalSumMonoid implements Monoid_<Decimal> {
  const DecimalSumMonoid();

  @override
  Decimal identity() => Decimal.zero;

  @override
  Decimal operate(Decimal a, Decimal b) => a + b;
}

class DecimalProductMonoid implements Monoid_<Decimal> {
  const DecimalProductMonoid();

  @override
  Decimal identity() => Decimal.one;

  @override
  Decimal operate(Decimal a, Decimal b) => a * b;
}

class StringConcatMonoid implements Monoid_<String> {
  const StringConcatMonoid();

  @override
  String identity() => "";

  @override
  String operate(String a, String b) => a + b;
}

// Unsafe
class NumSumMonoid implements Monoid_<num> {
  const NumSumMonoid();

  @override
  num identity() => 0.0;

  @override
  num operate(num a, num b) => a + b;
}

// Unsafe
class NumProductMonoid implements Monoid_<num> {
  const NumProductMonoid();

  @override
  num identity() => 1.0;

  @override
  num operate(num a, num b) => a * b;
}

// Unsafe
class IntSumMonoid implements Monoid_<int> {
  const IntSumMonoid();

  @override
  int identity() => 0;

  @override
  int operate(int a, int b) => a + b;
}

// Unsafe
class IntProductMonoid implements Monoid_<int> {
  const IntProductMonoid();

  @override
  int identity() => 1;

  @override
  int operate(int a, int b) => a * b;
}

// Unsafe
class DoubleSumMonoid implements Monoid_<double> {
  const DoubleSumMonoid();

  @override
  double identity() => 0.0;

  @override
  double operate(double a, double b) => a + b;
}

// Unsafe
class DoubleProductMonoid implements Monoid_<double> {
  const DoubleProductMonoid();

  @override
  double identity() => 1.0;

  @override
  double operate(double a, double b) => a * b;
}

// Unsafe
class DurationSumMonoid implements Monoid_<Duration> {
  const DurationSumMonoid();

  @override
  Duration identity() => Duration.zero;

  @override
  Duration operate(Duration a, Duration b) => a + b;
}
