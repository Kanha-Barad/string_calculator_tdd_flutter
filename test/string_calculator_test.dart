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

}
