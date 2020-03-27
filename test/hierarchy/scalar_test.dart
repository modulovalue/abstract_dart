import 'package:abstract_dart/abstract_dart.dart';
import 'package:test/test.dart';

void main() {
  group("$VectorSpace_", () {
    test("addition", () {
      expect(testVectorSpace.addition.identity(), zero);
      expect(testVectorSpace.addition.operate(threefive, elevenfifteen),
          const _Tuple2(14.0, 20.0));
      expect(testVectorSpace.addition.inverse(threefive, elevenfifteen),
          const _Tuple2(-8.0, -10.0));
    });
    test("scalar", () {
      expect(testVectorSpace.scalar.sIdentity(), 1.0);
      expect(testVectorSpace.scalar.sOperate(elevenfifteen, 2.0),
          const _Tuple2(22.0, 30.0));
    });
  });
  group("$Algebra_", () {
    test("addition", () {
      expect(testAlgebra.addition.identity(), zero);
      expect(testAlgebra.addition.operate(threefive, elevenfifteen),
          const _Tuple2(14.0, 20.0));
      expect(testAlgebra.addition.inverse(threefive, elevenfifteen),
          const _Tuple2(-8.0, -10.0));
    });
    test("multiplication", () {
      expect(testAlgebra.multiplication.identity(), zero);
      expect(testAlgebra.multiplication.operate(threefive, elevenfifteen),
          const _Tuple2(33.0, 75.0));
      expect(testAlgebra.multiplication.inverse(threefive, elevenfifteen),
          const _Tuple2(3.0 / 11.0, 5.0 / 15.0));
    });
    test("scalar", () {
      expect(testAlgebra.scalar.sIdentity(), 1.0);
      expect(testAlgebra.scalar.sOperate(elevenfifteen, 2.0),
          const _Tuple2(22.0, 30.0));
    });
  });
}

const _Tuple2<double, double> zero = _Tuple2(0.0, 0.0);
const _Tuple2<double, double> one = _Tuple2(1.0, 1.0);
const _Tuple2<double, double> threefive = _Tuple2(3.0, 5.0);
const _Tuple2<double, double> elevenfifteen = _Tuple2(11.0, 15.0);

Group_<_Tuple2<double, double>> _addition = Group_.define(
  () => const _Tuple2(0.0, 0.0),
  (a, b) => _Tuple2(a.key + b.key, a.value + b.value),
  (a, b) => _Tuple2(a.key - b.key, a.value - b.value),
);

Group_<_Tuple2<double, double>> _multiplication = Group_.define(
  () => const _Tuple2(0.0, 0.0),
  (a, b) => _Tuple2(a.key * b.key, a.value * b.value),
  (a, b) => _Tuple2(a.key / b.key, a.value / b.value),
);

ScalarMonoid_<_Tuple2<double, double>, double> _scalarMultiplication =
    ScalarMonoid_.define(() => 1.0, (a, b) => _Tuple2(a.key * b, a.value * b));

VectorSpace_<_Tuple2<double, double>, double> testVectorSpace =
    VectorSpace_.define(
  _addition,
  _scalarMultiplication,
);

Algebra_<_Tuple2<double, double>, double> testAlgebra = Algebra_.define(
  Field_.define(_addition, _multiplication),
  _scalarMultiplication,
);

class _Tuple2<A, B> {
  final A key;
  final B value;

  const _Tuple2(this.key, this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _Tuple2 &&
          runtimeType == other.runtimeType &&
          key == other.key &&
          value == other.value;

  @override
  int get hashCode => key.hashCode ^ value.hashCode;

  @override
  String toString() => '_Tuple2{key: $key, value: $value}';
}
