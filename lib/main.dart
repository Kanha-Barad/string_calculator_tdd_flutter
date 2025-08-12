import 'package:flutter/material.dart';
import 'string_calculator_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'String Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StringCalculatorPage(),
    );
  }
}
