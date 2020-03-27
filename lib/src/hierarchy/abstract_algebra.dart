import 'package:abstract_dart/abstract_dart.dart';
import 'package:abstract_dart/src/hierarchy/abstract_algebra_anonymous.dart';

/// https://en.wikipedia.org/wiki/Semigroup
///
/// In mathematics, a semigroup is an algebraic structure consisting
/// of a set together with an associative binary operation.
///
/// * Each [Monoid_] is a [Semigroup_]
///
/// A [Semigroup_] is a special space of a [ScalarSemigroup_] where K and F
/// are the same sets. But in practice this
///
abstract class Semigroup_<S> {
  const factory Semigroup_.define(
    S Function(S a, S b) operation,
  ) = AnonymousSemigroup<S>;

  S operate(S a, S b);
}

/// https://en.wikipedia.org/wiki/Monoid
///
/// In abstract algebra, a branch of mathematics, a monoid is an algebraic
/// structure with a single associative binary operation and an identity element.
///
/// * [BigIntSumMonoid]
/// * [BigIntProductMonoid]
/// * [DecimalSumMonoid]
/// * [DecimalProductMonoid]
/// * [StringConcatMonoid]
/// * [NumSumMonoid]
/// * [NumProductMonoid]
/// * [IntSumMonoid]
/// * [IntProductMonoid]
/// * [DoubleSumMonoid]
/// * [DoubleProductMonoid]
/// * Each [Group_] is a [Monoid_]
///
abstract class Monoid_<S> implements Semigroup_<S> {
  const factory Monoid_.define(
    S Function() identity,
    S Function(S a, S b) operation,
  ) = AnonymousMonoid<S>;

  S identity();
}

/// https://en.wikipedia.org/wiki/Group_(mathematics)
///
/// In mathematics, a group is a set equipped with a binary operation that combines
/// any two elements to form a third element in such a way that four conditions
/// called group axioms are satisfied, namely closure, associativity, identity
/// and invertibility.
///
/// * [IntSumGroup]
/// * [BigIntSumGroup]
/// * [DecimalProductGroup]
/// * [DecimalSumGroup]
/// * [DoubleProductGroup]
/// * [DoubleSumGroup]
/// * [NumProductGroup]
/// * [NumSumGroup]
/// * Each [Field_] contains two [Group_]s
///
abstract class Group_<S> implements Monoid_<S> {
  const factory Group_.define(
    S Function() identity,
    S Function(S, S) operate,
    S Function(S, S) inverse,
  ) = AnonymousGroup<S>;

  S inverse(S a, S b);
}

/// https://en.wikipedia.org/wiki/Field_(mathematics)
///
/// In mathematics, a field is a set on which addition, subtraction, multiplication,
/// and division are defined.
///
/// * [DecimalField]
/// * [DoubleField]
/// * [NumField]
///
abstract class Field_<A> {
  const factory Field_.define(
    Group_<A> addition,
    Group_<A> multiplication,
  ) = AnonymousField<A>;

  Group_<A> get addition;

  Group_<A> get multiplication;
}

/// A [Monoid_] with scalar multiplication
abstract class Semispace_<K, F> {
  const factory Semispace_.define(
    Monoid_<K> addition,
    K Function(K vector, F scalar) _scalarMultiplication,
  ) = AnonymousSemispace<K, F>;

  Monoid_<K> get addition;

  K sOperate(K vector, F scalar);
}

/// A [Group_] with scalar multiplication
abstract class VectorSpace_<K, F> {
  const factory VectorSpace_.define(
    Group_<K> _vectorAddition,
    ScalarMonoid_<K, F> _scalarMonoid,
  ) = AnonymousVectorSpace_<K, F>;

  Group_<K> get addition;

  ScalarMonoid_<K, F> get scalar;
}

/// A [Field_] with scalar multiplication.
abstract class Algebra_<K, F> implements VectorSpace_<K, F>, Field_<K> {
  const factory Algebra_.define(
    Field_<K> _field,
    ScalarMonoid_<K, F> _scalarMonoid,
  ) = AnonymousAlgebra<K, F>;
}

// These interfaces use the concept of a scalar to say that
// the second argument of the operation has a different type.

/// Same as a [Semigroup_] but instead of operating on objects from the same set
/// a [ScalarSemigroup_] operates on two types from different sets and returns
/// the left type.
abstract class ScalarSemigroup_<K, F> {
  const factory ScalarSemigroup_.define(
    K Function(K vector, F scalar) _scalarMultiplication,
  ) = AnonymousScalarSemigroup<K, F>;

  K sOperate(K vector, F scalar);
}

/// Same as a [Monoid_] but instead of operating on objects from the same set
/// a [ScalarMonoid_] operates on two types from different sets and returns
/// the left type as a result.
abstract class ScalarMonoid_<K, F> implements ScalarSemigroup_<K, F> {
  const factory ScalarMonoid_.define(
    F Function() _scalarIndentity,
    K Function(K vector, F scalar) _scalarMultiplication,
  ) = AnonymousScalarMonoid<K, F>;

  F sIdentity();

  @override
  K sOperate(K vector, F scalar);
}
