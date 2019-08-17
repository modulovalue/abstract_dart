import 'package:abstract_dart/abstract_dart.dart';
import 'package:decimal/decimal.dart';

class FieldLerp<T> {
  final T from;
  final T to;
  final Field_<T> field;

  const FieldLerp(this.from, this.to, this.field)
      : assert(from != null),
        assert(to != null),
        assert(field != null);

  /// Linearly interpolate between [from] and [to].
  T lerp(T t) => field.addition.operate(
        field.addition.inverse(
          from,
          field.multiplication.operate(from, t),
        ),
        field.multiplication.operate(to, t),
      );

  /// Inverse of [lerp].
  ///
  ///     from = 10
  ///     to = 20
  ///     reLerp(15) // gives 0.5
  ///
  T reLerp(T t) => field.multiplication.inverse(
        field.addition.inverse(t, from),
        field.addition.inverse(to, from),
      );

  FieldLerp<T> copyWith({T from, T to}) => FieldLerp(from ?? this.from, to ?? this.to, field);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is FieldLerp<T> && runtimeType == other.runtimeType && from == other.from && to == other.to;
  }

  @override
  int get hashCode => from.hashCode ^ to.hashCode;
}

class DecimalLerp extends FieldLerp<Decimal> {
  const DecimalLerp(Decimal from, Decimal to) : super(from, to, const DecimalField());
}

// unsafe
class DoubleLerp extends FieldLerp<double> {
  const DoubleLerp(double from, double to) : super(from, to, const DoubleField());
}
