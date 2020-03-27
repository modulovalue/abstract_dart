import 'package:abstract_dart/abstract_dart.dart';
import 'package:test/test.dart';

void main() {
  group("Semigroup_", () {
    test(".create", () {
      expect(Semigroup_<double>.define((a, b) => a + b).operate(2.0, 3.0), 5.0);
    });
  });
  group("Monoid_", () {
    test(".create", () {
      expect(
          Monoid_<double>.define(() => 0.0, (a, b) => a + b).operate(2.0, 3.0),
          5.0);
      expect(
          Monoid_<double>.define(() => 0.0, (a, b) => a + b).identity(), 0.0);
    });
  });
  group("Group_", () {
    test(".create", () {
      expect(
          Group_<double>.define(() => 0.0, (a, b) => a + b, (a, b) => a - b)
              .operate(2.0, 3.0),
          5.0);
      expect(
          Group_<double>.define(() => 0.0, (a, b) => a + b, (a, b) => a - b)
              .inverse(2.0, 3.0),
          -1.0);
      expect(
          Group_<double>.define(() => 0.0, (a, b) => a + b, (a, b) => a - b)
              .identity(),
          0.0);
    });
  });
  group("Field_", () {
    test(".create", () {
      final addition =
          Group_<double>.define(() => 0.0, (a, b) => a + b, (a, b) => a - b);
      final multiplication =
          Group_<double>.define(() => 1.0, (a, b) => a * b, (a, b) => a / b);
      final field = Field_<double>.define(addition, multiplication);
      expect(identical(field.addition, addition), true);
      expect(identical(field.multiplication, multiplication), true);
    });
  });
}
