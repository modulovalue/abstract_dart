import 'package:abstract_dart/src/implementation/base/fields.dart';
import 'package:decimal/decimal.dart';
import 'package:test/test.dart';

// so coverage catches constructors
//ignore_for_file: prefer_const_constructors
void main() {
  group("$DecimalField", () {
    test("addition", () {
      expect(
          DecimalField()
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
      expect(DoubleField().addition.operate(3, 5), 8);
    });
    test("multiplication", () {
      expect(const DoubleField().multiplication.operate(3, 5), 15);
    });
  });
  group("$NumField", () {
    test("addition", () {
      expect(NumField().addition.operate(3, 5), 8);
    });
    test("multiplication", () {
      expect(const NumField().multiplication.operate(3, 5), 15);
    });
  });
}
