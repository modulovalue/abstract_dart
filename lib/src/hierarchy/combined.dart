import 'package:abstract_dart/abstract_dart.dart';

/// A [Monoid_] with scalar multiplication
abstract class Semispace_<K, F> {
  static Semispace_<K, F> create<K, F>(
    Monoid_<K> _addition,
    K Function(K vector, F scalar) _scalarMultiplication,
  ) =>
      _AnonymousSemispace(_addition, _scalarMultiplication);

  const factory Semispace_.define(
    Monoid_<K> addition,
    K Function(K vector, F scalar) _scalarMultiplication,
  ) = _AnonymousSemispace;

  Monoid_<K> get addition;

  K sOperate(K vector, F scalar);
}

class _AnonymousSemispace<K, F> implements Semispace_<K, F> {
  @override
  final Monoid_<K> addition;
  final K Function(K vector, F scalar) _scalarMultiplication;

  const _AnonymousSemispace(this.addition, this._scalarMultiplication);

  @override
  K sOperate(K vector, F scalar) => _scalarMultiplication(vector, scalar);
}

/// A [Group_] with scalar multiplication
abstract class VectorSpace_<K, F> {
  @Deprecated("use define")
  static VectorSpace_<K, F> create<K, F>(
    Group_<K> _vectorAddition,
    ScalarMonoid_<K, F> _scalarMonoid,
  ) =>
      _AnonymousVectorSpace_(_vectorAddition, _scalarMonoid);

  const factory VectorSpace_.define(
    Group_<K> _vectorAddition,
    ScalarMonoid_<K, F> _scalarMonoid,
  ) = _AnonymousVectorSpace_;

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
  @Deprecated("use define")
  static Algebra_<K, F> create<K, F>(
    Field_<K> _field,
    ScalarMonoid_<K, F> _scalarMonoid,
  ) =>
      _AnonymousAlgebra(_field, _scalarMonoid);

  const factory Algebra_.define(
    Field_<K> _field,
    ScalarMonoid_<K, F> _scalarMonoid,
  ) = _AnonymousAlgebra;
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
