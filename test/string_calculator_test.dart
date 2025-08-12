import 'package:flutter_test/flutter_test.dart';
import 'package:string_calculator_tdd/string_calculator.dart';

void main() {
  test('Empty string returns 0', () {
    expect(add(''), equals(0));
  });
}
