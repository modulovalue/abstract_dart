import 'package:abstract_dart/abstract_dart.dart';

/// https://en.wikipedia.org/wiki/Semigroup
///
/// In mathematics, a semigroup is an algebraic structure consisting
/// of a set together with an associative binary operation.
///
/// * Each [Monoid_] is a [Semigroup_]
///
abstract class Semigroup_<S> {
  static Semigroup_<S> create<S>(S Function(S a, S b) operation) {
    return _AnonymousSemigroup(operation);
  }

  S operate(S a, S b);
}

class _AnonymousSemigroup<S> implements Semigroup_<S> {
  final S Function(S a, S b) _operate;

  const _AnonymousSemigroup(this._operate);

  @override
  S operate(S a, S b) => _operate(a, b);
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
  static Monoid_<S> create<S>(
      S Function() identity, S Function(S a, S b) operation) {
    return _AnonymousMonoid(identity, operation);
  }

  S identity();
}

class _AnonymousMonoid<S> implements Monoid_<S> {
  final S Function() _identity;
  final S Function(S a, S b) _operate;

  const _AnonymousMonoid(this._identity, this._operate);

  @override
  S identity() => _identity();

  @override
  S operate(S a, S b) => _operate(a, b);
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
  S inverse(S a, S b);

  static Group_<S> create<S>(S Function() identity, S Function(S, S) operate,
      S Function(S, S) inverse) {
    return _AnonymousGroup(identity, operate, inverse);
  }
}

class _AnonymousGroup<S> implements Group_<S> {
  final S Function() _identity;
  final S Function(S a, S b) _operate;
  final S Function(S a, S b) _inverse;

  const _AnonymousGroup(this._identity, this._operate, this._inverse);

  @override
  S identity() => _identity();

  @override
  S operate(S a, S b) => _operate(a, b);

  @override
  S inverse(S a, S b) => _inverse(a, b);
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
  static Field_<S> create<S>(Group_<S> addition, Group_<S> multiplication) {
    return _AnonymousField(addition, multiplication);
  }

  Group_<A> get addition;

  Group_<A> get multiplication;
}

class _AnonymousField<S> implements Field_<S> {
  final Group_<S> _addition;
  final Group_<S> _multiplication;

  const _AnonymousField(this._addition, this._multiplication);

  @override
  Group_<S> get addition => _addition;

  @override
  Group_<S> get multiplication => _multiplication;
}
