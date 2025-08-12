import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:string_calculator_tdd/string_calculator_page.dart';

void main() {
  testWidgets('calculates sum from UI input', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: StringCalculatorPage()));

    final input = find.byKey(const Key('inputField'));
    final button = find.byKey(const Key('calculateButton'));

    await tester.enterText(input, '1,2,3');
    await tester.tap(button);
    await tester.pumpAndSettle();

    expect(find.text('Result: 6'), findsOneWidget);
  });

  testWidgets('shows negative number error in UI', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: StringCalculatorPage()));

    final input = find.byKey(const Key('inputField'));
    final button = find.byKey(const Key('calculateButton'));

    await tester.enterText(input, '1,-2');
    await tester.tap(button);
    await tester.pumpAndSettle();

    expect(find.textContaining('negative numbers not allowed -2'), findsOneWidget);
  });
}
