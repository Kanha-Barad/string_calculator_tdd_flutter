import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:string_calculator_tdd/string_calculator_page.dart';

void main() {
  testWidgets('Calculate sum from input', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: StringCalculatorPage()));

    final inputField = find.byType(TextField);
    final calculateButton = find.text('Calculate');

    // Enter numbers
    await tester.enterText(inputField, '1,2,3');
    await tester.tap(calculateButton);
    await tester.pumpAndSettle();

    // Expect result to be shown
    expect(find.text('Result: 6'), findsOneWidget);
  });

  testWidgets('Show error message for negative numbers', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: StringCalculatorPage()));

    final inputField = find.byType(TextField);
    final calculateButton = find.text('Calculate');

    // Enter negative number input
    await tester.enterText(inputField, '1,-2');
    await tester.tap(calculateButton);
    await tester.pumpAndSettle();

    // Expect error message
    expect(find.textContaining('negative numbers not allowed -2'), findsOneWidget);
  });
}
