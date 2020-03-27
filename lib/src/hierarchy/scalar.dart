import 'package:abstract_dart/abstract_dart.dart';

/// Same as a [Monoid_] but instead of operating on objects from the same set
/// a [ScalarMonoid_] operates on two types from different sets and returns
/// the left type as a result.
abstract class ScalarMonoid_<K, F> {
  static ScalarMonoid_<K, F> create<K, F>(F Function() _scalarIndentity,
      K Function(K vector, F scalar) _scalarMultiplication) {
    return _AnonymousScalarMonoid(_scalarIndentity, _scalarMultiplication);
  }

  F sIdentity();

  K sOperate(K vector, F scalar);
}

class _AnonymousScalarMonoid<K, F> implements ScalarMonoid_<K, F> {
  final F Function() _scalarIndentity;
  final K Function(K vector, F scalar) _scalarMultiplication;

  const _AnonymousScalarMonoid(
      this._scalarIndentity, this._scalarMultiplication);

  @override
  F sIdentity() => _scalarIndentity();

  @override
  K sOperate(K vector, F scalar) => _scalarMultiplication(vector, scalar);
}

abstract class VectorSpace_<K, F> {
  static VectorSpace_<K, F> create<K, F>(
      Group_<K> _vectorAddition, ScalarMonoid_<K, F> _scalarMonoid) {
    return _AnonymousVectorSpace_(_vectorAddition, _scalarMonoid);
  }

  Group_<K> get addition;

  ScalarMonoid_<K, F> get scalar;
}

class _AnonymousVectorSpace_<K, F> implements VectorSpace_<K, F> {
  final Group_<K> _vectorAddition;
  final ScalarMonoid_<K, F> _scalarMonoid;

  const _AnonymousVectorSpace_(this._vectorAddition, this._scalarMonoid);

  @override
  Group_<K> get addition => _vectorAddition;

  @override
  ScalarMonoid_<K, F> get scalar => _scalarMonoid;
}

/// A [Field_] with scalar multiplication.
abstract class Algebra_<K, F> implements VectorSpace_<K, F>, Field_<K> {
  static Algebra_<K, F> create<K, F>(
      Field_<K> _field, ScalarMonoid_<K, F> _scalarMonoid) {
    return _AnonymousAlgebra(_field, _scalarMonoid);
  }
}

class _AnonymousAlgebra<K, F> implements Algebra_<K, F> {
  final Field_<K> _field;
  final ScalarMonoid_<K, F> _scalarMonoid;

  const _AnonymousAlgebra(this._field, this._scalarMonoid);

  @override
  Group_<K> get addition => _field.addition;

  @override
  Group_<K> get multiplication => _field.multiplication;

  @override
  ScalarMonoid_<K, F> get scalar => _scalarMonoid;
}
