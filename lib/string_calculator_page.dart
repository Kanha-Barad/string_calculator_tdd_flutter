import 'package:flutter/material.dart';
import 'string_calculator.dart';

class StringCalculatorPage extends StatefulWidget {
  const StringCalculatorPage({Key? key}) : super(key: key);

  @override
  _StringCalculatorPageState createState() => _StringCalculatorPageState();
}

class _StringCalculatorPageState extends State<StringCalculatorPage> {
  final TextEditingController _controller = TextEditingController();
  String? _output;

  void _calculate() {
    try {
      final result = add(_controller.text);
      setState(() {
        _output = 'Result: $result';
      });
    } catch (e) {
      setState(() {
        // show the exception message without Exception:
        _output = e.toString().replaceAll('Exception: ', '');
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('String Calculator (TDD)')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              key: const Key('inputField'),
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter numbers (e.g. 1,2 or //;\\n1;2)',
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              key: const Key('calculateButton'),
              onPressed: _calculate,
              child: const Text('Calculate'),
            ),
            const SizedBox(height: 12),
            if (_output != null)
              Text(
                _output!,
                key: const Key('resultText'),
                style: const TextStyle(fontSize: 18),
              ),
          ],
        ),
      ),
    );
  }
}
