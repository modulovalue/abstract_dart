import 'package:abstract_dart/abstract_dart.dart';

// These interfaces use the concept of a scalar to say that
// the second argument of the operation is of a different type.

/// Same as a [Monoid_] but instead of operating on objects from the same set
/// a [ScalarMonoid_] operates on two types from different sets and returns
/// the left type as a result.
abstract class ScalarSemigroup_<K, F> {
  @Deprecated("use define")
  static ScalarSemigroup_<K, F> create<K, F>(
    K Function(K vector, F scalar) _scalarMultiplication,
  ) {
    return _AnonymousScalarSemigroup(_scalarMultiplication);
  }

  const factory ScalarSemigroup_.define(
    K Function(K vector, F scalar) _scalarMultiplication,
  ) = _AnonymousScalarSemigroup;

  K sOperate(K vector, F scalar);
}

class _AnonymousScalarSemigroup<K, F> implements ScalarSemigroup_<K, F> {
  final K Function(K vector, F scalar) _scalarMultiplication;

  const _AnonymousScalarSemigroup(this._scalarMultiplication);

  @override
  K sOperate(K vector, F scalar) => _scalarMultiplication(vector, scalar);
}

/// Same as a [Monoid_] but instead of operating on objects from the same set
/// a [ScalarMonoid_] operates on two types from different sets and returns
/// the left type as a result.
abstract class ScalarMonoid_<K, F> implements ScalarSemigroup_<K, F> {
  @Deprecated("use define")
  static ScalarMonoid_<K, F> create<K, F>(
    F Function() _scalarIndentity,
    K Function(K vector, F scalar) _scalarMultiplication,
  ) {
    return _AnonymousScalarMonoid(_scalarIndentity, _scalarMultiplication);
  }

  const factory ScalarMonoid_.define(
    F Function() _scalarIndentity,
    K Function(K vector, F scalar) _scalarMultiplication,
  ) = _AnonymousScalarMonoid;

  F sIdentity();

  @override
  K sOperate(K vector, F scalar);
}

class _AnonymousScalarMonoid<K, F> implements ScalarMonoid_<K, F> {
  final F Function() _scalarIndentity;
  final K Function(K vector, F scalar) _scalarMultiplication;

  const _AnonymousScalarMonoid(this._scalarIndentity, this._scalarMultiplication);

  @override
  F sIdentity() => _scalarIndentity();

  @override
  K sOperate(K vector, F scalar) => _scalarMultiplication(vector, scalar);
}
