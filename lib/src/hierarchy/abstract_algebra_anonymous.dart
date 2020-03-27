import 'package:abstract_dart/abstract_dart.dart';

class AnonymousSemigroup<S> implements Semigroup_<S> {
  final S Function(S a, S b) _operate;

  const AnonymousSemigroup(this._operate);

  @override
  S operate(S a, S b) => _operate(a, b);
}

class AnonymousMonoid<S> implements Monoid_<S> {
  final S Function() _identity;
  final S Function(S a, S b) _operate;

  const AnonymousMonoid(this._identity, this._operate);

  @override
  S identity() => _identity();

  @override
  S operate(S a, S b) => _operate(a, b);
}

class AnonymousGroup<S> implements Group_<S> {
  final S Function() _identity;
  final S Function(S a, S b) _operate;
  final S Function(S a, S b) _inverse;

  const AnonymousGroup(
    this._identity,
    this._operate,
    this._inverse,
  );

  @override
  S identity() => _identity();

  @override
  S operate(S a, S b) => _operate(a, b);

  @override
  S inverse(S a, S b) => _inverse(a, b);
}

class AnonymousField<S> implements Field_<S> {
  final Group_<S> _addition;
  final Group_<S> _multiplication;

  const AnonymousField(this._addition, this._multiplication);

  @override
  Group_<S> get addition => _addition;

  @override
  Group_<S> get multiplication => _multiplication;
}

class AnonymousSemispace<K, F> implements Semispace_<K, F> {
  @override
  final Monoid_<K> addition;
  final K Function(K vector, F scalar) _scalarMultiplication;

  const AnonymousSemispace(this.addition, this._scalarMultiplication);

  @override
  K sOperate(K vector, F scalar) => _scalarMultiplication(vector, scalar);
}

class AnonymousVectorSpace_<K, F> implements VectorSpace_<K, F> {
  final Group_<K> _vectorAddition;
  final ScalarMonoid_<K, F> _scalarMonoid;

  const AnonymousVectorSpace_(this._vectorAddition, this._scalarMonoid);

  @override
  Group_<K> get addition => _vectorAddition;

  @override
  ScalarMonoid_<K, F> get scalar => _scalarMonoid;
}

class AnonymousAlgebra<K, F> implements Algebra_<K, F> {
  final Field_<K> _field;
  final ScalarMonoid_<K, F> _scalarMonoid;

  const AnonymousAlgebra(this._field, this._scalarMonoid);

  @override
  Group_<K> get addition => _field.addition;

  @override
  Group_<K> get multiplication => _field.multiplication;

  @override
  ScalarMonoid_<K, F> get scalar => _scalarMonoid;
}

class AnonymousScalarSemigroup<K, F> implements ScalarSemigroup_<K, F> {
  final K Function(K vector, F scalar) _scalarMultiplication;

  const AnonymousScalarSemigroup(this._scalarMultiplication);

  @override
  K sOperate(K vector, F scalar) => _scalarMultiplication(vector, scalar);
}

class AnonymousScalarMonoid<K, F> implements ScalarMonoid_<K, F> {
  final F Function() _scalarIndentity;
  final K Function(K vector, F scalar) _scalarMultiplication;

  const AnonymousScalarMonoid(
    this._scalarIndentity,
    this._scalarMultiplication,
  );

  @override
  F sIdentity() => _scalarIndentity();

  @override
  K sOperate(K vector, F scalar) => _scalarMultiplication(vector, scalar);
}
