import 'package:abstract_dart/abstract_dart.dart';
import 'package:decimal/decimal.dart';

class DecimalField with FieldOps<Decimal> {
  const DecimalField();

  @override
  Group_<Decimal> get addition => const DecimalSumGroup();

  @override
  Group_<Decimal> get multiplication => const DecimalProductGroup();
}

// unsafe
class DoubleField with FieldOps<double> {
  const DoubleField();

  @override
  Group_<double> get addition => const DoubleSumGroup();

  @override
  Group_<double> get multiplication => const DoubleProductGroup();
}

// unsafe
class NumField with FieldOps<num> {
  const NumField();

  @override
  Group_<num> get addition => const NumSumGroup();

  @override
  Group_<num> get multiplication => const NumProductGroup();
}
