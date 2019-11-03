import 'package:abstract_dart/abstract_dart.dart';

void main() {
  /// Create a semigroup
  final semigroup = Semigroup_.create<double>((a, b) => a + b);

  /// Create a monoid
  final monoid = Monoid_.create<double>(() => 0.0, (a, b) => a + b);

  /// Create a group
  final group =
      Group_.create<double>(() => 0.0, (a, b) => a + b, (a, b) => a - b);

  /// Create a field
  final field = Field_.create<double>(
    Group_.create<double>(() => 0.0, (a, b) => a + b, (a, b) => a - b),
    Group_.create<double>(() => 1.0, (a, b) => a * b, (a, b) => a / b),
  );

  /// Monoids
  const bigIntSumMonoid = BigIntSumMonoid();
  const bigIntProductMonoid = BigIntProductMonoid();
  const decimalSumMonoid = DecimalSumMonoid();
  const decimalProductMonoid = DecimalProductMonoid();
  const stringConcatMonoid = StringConcatMonoid();
  const numSumMonoid = NumSumMonoid();
  const numProductMonoid = NumProductMonoid();
  const intSumMonoid = IntSumMonoid();
  const intProductMonoid = IntProductMonoid();
  const doubleSumMonoid = DoubleSumMonoid();
  const doubleProductMonoid = DoubleProductMonoid();

  /// Groups
  const bigIntSumGroup = BigIntSumGroup();
  const decimalSumGroup = DecimalSumGroup();
  const decimalProductGroup = DecimalProductGroup();
  const doubleProductGroup = DoubleProductGroup();
  const doubleSumGroup = DoubleSumGroup();
  const numProductGroup = NumProductGroup();
  const numSumGroup = NumSumGroup();

  /// Fields
  const decimalField = DecimalField();
  const doubleField = DoubleField();
  const numField = NumField();

  /// To suppress the unused warnings
  final _ = [
    semigroup,
    monoid,
    group,
    field,
    bigIntSumMonoid,
    bigIntProductMonoid,
    decimalSumMonoid,
    decimalProductMonoid,
    stringConcatMonoid,
    numSumMonoid,
    numProductMonoid,
    intSumMonoid,
    intProductMonoid,
    doubleSumMonoid,
    doubleProductMonoid,
    bigIntSumGroup,
    decimalSumGroup,
    decimalProductGroup,
    decimalProductGroup,
    doubleProductGroup,
    doubleSumGroup,
    numProductGroup,
    numSumGroup,
    decimalField,
    doubleField,
    numField,
  ];
}
