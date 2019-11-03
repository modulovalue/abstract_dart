import 'package:abstract_dart/abstract_dart.dart';
import 'package:decimal/decimal.dart';
import 'package:test/test.dart';

// so coverage catches constructors
//ignore_for_file: prefer_const_constructors
void main() {
  group("BigIntSumMonoid", () {
    test("operate", () {
      expect(BigIntSumMonoid().operate(BigInt.from(1), BigInt.from(2.0)),
          BigInt.from(3.0));
    });
    testIdentity(BigInt.from(7.0), const BigIntSumMonoid());
  });
  group("BigIntProductMonoid", () {
    test("operate", () {
      expect(BigIntProductMonoid().operate(BigInt.from(2), BigInt.from(3.0)),
          BigInt.from(6.0));
    });
    testIdentity(BigInt.from(7.0), const BigIntProductMonoid());
  });
  group("DecimalSumMonoid", () {
    test("operate", () {
      expect(DecimalSumMonoid().operate(Decimal.fromInt(2), Decimal.fromInt(3)),
          Decimal.fromInt(5));
    });
    testIdentity(Decimal.fromInt(7), const DecimalSumMonoid());
  });
  group("DecimalProductMonoid", () {
    test("operate", () {
      expect(
          DecimalProductMonoid()
              .operate(Decimal.fromInt(2), Decimal.fromInt(3)),
          Decimal.fromInt(6));
    });
    testIdentity(Decimal.fromInt(7), const DecimalProductMonoid());
  });
  group("StringConcatMonoid", () {
    test("operate", () {
      expect(StringConcatMonoid().operate("abc", "def"), "abcdef");
    });
    testIdentity("some string", const StringConcatMonoid());
  });
  group("NumSumMonoid", () {
    test("operate", () {
      expect(NumSumMonoid().operate(2.0, 3.0), 5.0);
    });
    testIdentity(7.0, const NumSumMonoid());
  });
  group("NumProductMonoid", () {
    test("operate", () {
      expect(NumProductMonoid().operate(2.0, 3.0), 6.0);
    });
    testIdentity(7.0, const NumProductMonoid());
  });
  group("IntSumMonoid", () {
    test("operate", () {
      expect(IntSumMonoid().operate(2, 3), 5.0);
    });
    testIdentity(7, const IntSumMonoid());
  });
  group("IntProductMonoid", () {
    test("operate", () {
      expect(IntProductMonoid().operate(2, 3), 6.0);
    });
    testIdentity(7, const IntProductMonoid());
  });
  group("DoubleSumMonoid", () {
    test("operate", () {
      expect(DoubleSumMonoid().operate(2, 3), 5.0);
    });
    testIdentity(7.0, const DoubleSumMonoid());
  });
  group("DoubleProductMonoid", () {
    test("operate", () {
      expect(DoubleProductMonoid().operate(2, 3), 6.0);
    });
    testIdentity(7.0, const DoubleProductMonoid());
  });
}

void testIdentity<T>(T value, Monoid_<T> monoid) {
  test("identity", () {
    expect(monoid.operate(value, monoid.identity()), value);
  });
}
