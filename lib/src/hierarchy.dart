// Why do all types end with an underscore?
// - To not clash with dartz (https://pub.dev/packages/dartz)

// What about other structures like Magmas, Rings, Semigroupoids, ...
// - They might describe some structures mathematically better,
//   but they seem, at the time of writing this, to be too verbose and complicated
//   for the intended use cases of this library.

/// https://en.wikipedia.org/wiki/Semigroup
///
/// In mathematics, a semigroup is an algebraic structure consisting
/// of a set together with an associative binary operation.
abstract class Semigroup_<S> {
  S operate(S a, S b);
}

class AnonymousSemigroup<S> implements Semigroup_<S> {
  final S Function(S a, S b) _operate;

  const AnonymousSemigroup(this._operate);

  @override
  S operate(S a, S b) => _operate(a, b);
}

/// https://en.wikipedia.org/wiki/Monoid
///
/// In abstract algebra, a branch of mathematics, a monoid is an algebraic
/// structure with a single associative binary operation and an identity element.
abstract class Monoid_<S> implements Semigroup_<S> {
  S identity();
}

class AnonymousMonoid<S> with MonoidOps<S> {
  final S Function() _identity;
  final S Function(S a, S b) _operate;

  const AnonymousMonoid(this._identity, this._operate);

  @override
  S identity() => _identity();

  @override
  S operate(S a, S b) => _operate(a, b);
}

mixin MonoidOps<S> implements Monoid_<S> {
  FocusedMonoid of(S t) => FocusedMonoid(t, this);
}

class FocusedMonoid<T> {
  final T value;

  final Monoid_<T> monoid;

  const FocusedMonoid(this.value, this.monoid);

  T operator *(T t) => monoid.operate(value, t);
}

/// https://en.wikipedia.org/wiki/Group_(mathematics)
///
/// In mathematics, a group is a set equipped with a binary operation that combines
/// any two elements to form a third element in such a way that four conditions
/// called group axioms are satisfied, namely closure, associativity, identity
/// and invertibility.
abstract class Group_<S> implements Monoid_<S> {
  S inverse(S a, S b);
}

class AnonymousGroup<S> with GroupOps<S> {
  final S Function() _identity;
  final S Function(S a, S b) _operate;
  final S Function(S a, S b) _inverse;

  const AnonymousGroup(this._identity, this._operate, this._inverse);

  @override
  S identity() => _identity();

  @override
  S operate(S a, S b) => _operate(a, b);

  @override
  S inverse(S a, S b) => _inverse(a, b);
}

mixin GroupOps<T> implements Group_<T> {
  FocusedGroup of(T t) => FocusedGroup(t, this);
}

class FocusedGroup<T> {
  final T value;

  final Group_<T> field;

  const FocusedGroup(this.value, this.field);

  T operator *(T t) => field.operate(value, t);

  T operator /(T t) => field.inverse(value, t);
}

/// https://en.wikipedia.org/wiki/Field_(mathematics)
///
/// In mathematics, a field is a set on which addition, subtraction, multiplication,
/// and division are defined
abstract class Field_<A> {
  Group_<A> get addition;

  Group_<A> get multiplication;
}

class AnonymousField<S> with FieldOps<S> {
  final Group_<S> _addition;
  final Group_<S> _multiplication;

  const AnonymousField(this._addition, this._multiplication);

  @override
  Group_<S> get addition => _addition;

  @override
  Group_<S> get multiplication => _multiplication;
}

mixin FieldOps<T> implements Field_<T> {
  T add(T a, T b) => addition.operate(a, b);

  T subtract(T a, T b) => addition.inverse(a, b);

  T multiply(T a, T b) => multiplication.operate(a, b);

  T divide(T a, T b) => multiplication.inverse(a, b);

  FocusedField of(T t) => FocusedField(t, this);
}

class FocusedField<T> {
  final T value;

  final Field_<T> field;

  const FocusedField(this.value, this.field);

  T operator +(T t) => field.addition.operate(value, t);

  T operator -(T t) => field.addition.inverse(value, t);

  T operator *(T t) => field.multiplication.operate(value, t);

  T operator /(T t) => field.multiplication.inverse(value, t);
}