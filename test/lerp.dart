import 'package:abstract_dart/src/uses/lerp.dart';
import 'package:test/test.dart';

void main() {
    group("$DoubleLerp", () {
        test("not null", () {
            // ignore: prefer_const_constructors
            expect(() => DoubleLerp(null, 1.0), throwsA(const TypeMatcher<AssertionError>()));
            // ignore: prefer_const_constructors
            expect(() => DoubleLerp(1.0, null), throwsA(const TypeMatcher<AssertionError>()));
        });

        test("lerp negative & positive", () {
            const range = DoubleLerp(-100.0, 100.0);
            expect(range.lerp(0.0), -100.0);
            expect(range.lerp(0.5), 0.0);
            expect(range.lerp(1.0), 100.0);
            expect(range.lerp(2.0), 300.0);
            expect(range.lerp(10.0), 1900.0);
            expect(range.lerp(-1.0), -300.0);
        });

        test("reLerp negative & positive", () {
            const range = DoubleLerp(-100.0, 100.0);
            expect(range.reLerp(0.0), 0.5);
            expect(range.reLerp(100.0), 1.0);
            expect(range.reLerp(1000.0), 5.5);
            expect(range.reLerp(-100.0), 0.0);
            expect(range.reLerp(50.0), 0.75);
        });

        test("lerp ascending", () {
            const range = DoubleLerp(0.0, 100.0);
            expect(range.lerp(0.0), 0.0);
            expect(range.lerp(0.5), 50.0);
            expect(range.lerp(1.0), 100.0);
            expect(range.lerp(10.0), 1000.0);
            expect(range.lerp(-1.0), -100.0);
        });

        test("lerp descending", () {
            const range = DoubleLerp(100.0, 0.0);
            expect(range.lerp(0.0), 100.0);
            expect(range.lerp(0.5), 50.0);
            expect(range.lerp(1.0), 0.0);
            expect(range.lerp(10.0), -900.0);
            expect(range.lerp(-1.0), 200.0);
        });

        test("reLerp ascending", () {
            const range = DoubleLerp(0.0, 100.0);
            expect(range.reLerp(0.0), 0.0);
            expect(range.reLerp(100.0), 1.0);
            expect(range.reLerp(1000.0), 10.0);
            expect(range.reLerp(-100.0), -1.0);
            expect(range.reLerp(50.0), 0.5);
        });

        test("reLerp descending", () {
            const range = DoubleLerp(100.0, 0.0);
            expect(range.reLerp(0.0), 1.0);
            expect(range.reLerp(100.0), 0.0);
            expect(range.reLerp(1000.0), -9.0);
            expect(range.reLerp(-100.0), 2.0);
            expect(range.reLerp(50.0), 0.5);
        });

        test("==", () {
            expect(const DoubleLerp(2.0, 2.0), const DoubleLerp(2.0, 2.0));
        });

        test("hashCode", () {
            expect(const DoubleLerp(2.0, 2.0).hashCode, const DoubleLerp(2.0, 2.0).hashCode);
            expect(const DoubleLerp(2.0, 1.0).hashCode, isNot(const DoubleLerp(2.0, 2.0).hashCode));
        });

        test("!=", () {
            expect(const DoubleLerp(2.0, 1.0), isNot(const DoubleLerp(2.0, 2.0)));
        });

        test("copyWith", () {
            expect(const DoubleLerp(2.0, 1.0)
                .copyWith(from: 3.0)
                .from, 3.0);
            expect(const DoubleLerp(2.0, 1.0)
                .copyWith(from: 3.0)
                .to, 1.0);
            expect(const DoubleLerp(2.0, 1.0)
                .copyWith(to: 3.0)
                .from, 2.0);
            expect(const DoubleLerp(2.0, 1.0)
                .copyWith(to: 3.0)
                .to, 3.0);
        });
    });
}