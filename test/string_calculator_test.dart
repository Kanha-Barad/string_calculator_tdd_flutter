import 'package:flutter_test/flutter_test.dart';
import 'package:string_calculator_tdd/string_calculator.dart';

void main() {
  test('Single number returns value', () {
    expect(add('1'), equals(1));
  });

  test('Two numbers return sum', () {
    expect(add('1,5'), equals(6));
  });

  test('Multiple numbers return sum', () {
    expect(add('1,2,3,4'), equals(10));
  });

  test('Newline delimiter is supported', () {
    expect(add('1\n2,3'), equals(6));
  });

  test('Custom delimiter specified', () {
    expect(add('//;\n1;2'), equals(3));
  });

  test('Negative numbers throw exception (single)', () {
    expect(() => add('1,-2'),
        throwsA(predicate((e) => e.toString().contains('negative numbers not allowed -2'))));
  });

  test('Negative numbers throw exception (multiple)', () {
    expect(() => add('-1,-2,3'),
        throwsA(predicate((e) => e.toString().contains('negative numbers not allowed -1,-2'))));
  });

}