import 'package:abstract_dart/abstract_dart.dart';
import 'package:test/test.dart';

// so coverage catches constructors
//ignore_for_file: prefer_const_constructors
void main() {
  group("$DurationScalarMonoid", () {
    test("scalar", () {
      expect(DurationScalarMonoid().sIdentity(), 1.0);
      expect(DurationScalarMonoid().sOperate(_ms300, 1.5),
          const Duration(milliseconds: 450));
    });
  });
  group("$DurationVectorSpace", () {
    test("addition", () {
      expect(DurationVectorSpace().addition.operate(_ms300, _ms700),
          const Duration(milliseconds: 1000));
      expect(DurationVectorSpace().addition.inverse(_ms300, _ms700),
          const Duration(milliseconds: -400));
      expect(DurationVectorSpace().addition.identity(),
          const Duration(milliseconds: 0));
    });
    test("scalar", () {
      expect(DurationVectorSpace().scalar.sIdentity(), 1.0);
      expect(DurationVectorSpace().scalar.sOperate(_ms300, 1.5),
          const Duration(milliseconds: 450));
    });
  });
}

const Duration _ms300 = Duration(milliseconds: 300);
const Duration _ms700 = Duration(milliseconds: 700);
