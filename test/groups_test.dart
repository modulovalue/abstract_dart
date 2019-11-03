import 'package:abstract_dart/abstract_dart.dart';
import 'package:decimal/decimal.dart';
import 'package:test/test.dart';

// so coverage catches constructors
//ignore_for_file: prefer_const_constructors
void main() {
  group("BigIntSumGroup", () {
    test("inverse", () {
      expect(BigIntSumGroup().inverse(BigInt.from(1), BigInt.from(2)),
          BigInt.from(-1));
    });
  });
  group("DecimalSumGroup", () {
    test("inverse", () {
      expect(DecimalSumGroup().inverse(Decimal.fromInt(1), Decimal.fromInt(2)),
          Decimal.fromInt(-1));
    });
  });
  group("DecimalProductGroup", () {
    test("inverse", () {
      expect(
          DecimalProductGroup().inverse(Decimal.fromInt(6), Decimal.fromInt(3)),
          Decimal.fromInt(2));
      expect(
          () => const DecimalProductGroup()
              .inverse(Decimal.fromInt(6), Decimal.fromInt(0)),
          throwsA(const TypeMatcher<ArgumentError>()));
    });
  });
  group("DoubleProductGroup", () {
    test("inverse", () {
      expect(DoubleProductGroup().inverse(6.0, 3.0), 2.0);
      expect(const DoubleProductGroup().inverse(6.0, 0.0), double.infinity);
    });
  });
  group("DoubleSumGroup", () {
    test("inverse", () {
      expect(DoubleSumGroup().inverse(6, 2), 4);
    });
  });
  group("NumProductGroup", () {
    test("inverse", () {
      expect(NumProductGroup().inverse(6, 3), 2);
      expect(const NumProductGroup().inverse(6, 0), double.infinity);
    });
  });
  group("NumSumGroup", () {
    test("inverse", () {
      expect(NumSumGroup().inverse(6, 2), 4);
    });
  });
}
