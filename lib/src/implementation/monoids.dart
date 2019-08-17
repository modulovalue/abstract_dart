import 'package:abstract_dart/abstract_dart.dart';
import 'package:decimal/decimal.dart';

class BigIntSumMonoid with MonoidOps<BigInt> {
  const BigIntSumMonoid();

  @override
  BigInt identity() => BigInt.zero;

  @override
  BigInt operate(BigInt a, BigInt b) => a + b;
}

class BigIntProductMonoid with MonoidOps<BigInt> {
  const BigIntProductMonoid();

  @override
  BigInt identity() => BigInt.one;

  @override
  BigInt operate(BigInt a, BigInt b) => a * b;
}

class DecimalSumMonoid with MonoidOps<Decimal> {
  const DecimalSumMonoid();

  @override
  Decimal identity() => Decimal.zero;

  @override
  Decimal operate(Decimal a, Decimal b) => a + b;
}

class DecimalProductMonoid with MonoidOps<Decimal> {
  const DecimalProductMonoid();

  @override
  Decimal identity() => Decimal.one;

  @override
  Decimal operate(Decimal a, Decimal b) => a * b;
}

class StringConcatMonoid with MonoidOps<String> {
  const StringConcatMonoid();

  @override
  String identity() => "";

  @override
  String operate(String a, String b) => a + b;
}

// Unsafe
class NumSumMonoid with MonoidOps<num> {
  const NumSumMonoid();

  @override
  num identity() => 0;

  @override
  num operate(num a, num b) => a + b;
}

// Unsafe
class NumProductMonoid with MonoidOps<num> {
  const NumProductMonoid();

  @override
  num identity() => 1;

  @override
  num operate(num a, num b) => a * b;
}

// Unsafe
class IntSumMonoid with MonoidOps<int> {
  const IntSumMonoid();

  @override
  int identity() => 0;

  @override
  int operate(int a, int b) => a + b;
}

// Unsafe
class IntProductMonoid with MonoidOps<int> {
  const IntProductMonoid();

  @override
  int identity() => 1;

  @override
  int operate(int a, int b) => a * b;
}

// Unsafe
class DoubleSumMonoid with MonoidOps<double> {
  const DoubleSumMonoid();

  @override
  double identity() => 0.0;

  @override
  double operate(double a, double b) => a + b;
}

// Unsafe
class DoubleProductMonoid with MonoidOps<double> {
  const DoubleProductMonoid();

  @override
  double identity() => 1.0;

  @override
  double operate(double a, double b) => a * b;
}
