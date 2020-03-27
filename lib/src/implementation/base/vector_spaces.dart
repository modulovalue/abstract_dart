import 'package:abstract_dart/abstract_dart.dart';

// Scalar multiplication performs rounding.
class DurationVectorSpace implements VectorSpace_<Duration, num> {
  @override
  Group_<Duration> get addition => const DurationSumGroup();

  @override
  ScalarMonoid_<Duration, num> get scalar => const DurationScalarMonoid();
}

// Scalar multiplication performs rounding.
class DurationScalarMonoid implements ScalarMonoid_<Duration, num> {
  const DurationScalarMonoid();

  @override
  num sIdentity() => 1.0;

  @override
  Duration sOperate(Duration vector, num scalar) => vector * scalar;
}
