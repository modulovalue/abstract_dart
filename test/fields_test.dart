import 'package:abstract_dart/src/implementation/fields.dart';
import 'package:decimal/decimal.dart';
import 'package:test/test.dart';

void main() {
  group("$DecimalField", () {
    test("addition", () {
      expect(
          const DecimalField()
              .addition
              .operate(Decimal.fromInt(3), Decimal.fromInt(5)),
          Decimal.fromInt(8));
    });
    test("multiplication", () {
      expect(
          const DecimalField()
              .multiplication
              .operate(Decimal.fromInt(3), Decimal.fromInt(5)),
          Decimal.fromInt(15));
    });
  });
  group("$DoubleField", () {
    test("addition", () {
      expect(const DoubleField().addition.operate(3, 5), 8);
    });
    test("multiplication", () {
      expect(const DoubleField().multiplication.operate(3, 5), 15);
    });
  });
  group("$NumField", () {
    test("addition", () {
      expect(const NumField().addition.operate(3, 5), 8);
    });
    test("multiplication", () {
      expect(const NumField().multiplication.operate(3, 5), 15);
    });
  });
}
