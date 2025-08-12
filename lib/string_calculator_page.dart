import 'package:flutter/material.dart';
import 'string_calculator.dart';

class StringCalculatorPage extends StatefulWidget {
  const StringCalculatorPage({Key? key}) : super(key: key);

  @override
  _StringCalculatorPageState createState() => _StringCalculatorPageState();
}

class _StringCalculatorPageState extends State<StringCalculatorPage> {
  final TextEditingController _controller = TextEditingController();
  String? _resultMessage;

  void _calculate() {
    try {
      final result = add(_controller.text);
      setState(() {
        _resultMessage = 'Result: $result';
      });
    } catch (e) {
      setState(() {
        _resultMessage = e.toString().replaceFirst('Exception: ', '');
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
      appBar: AppBar(title: const Text('String Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter numbers (e.g. 1,2 or //;\\n1;2)',
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _calculate,
              child: const Text('Calculate'),
            ),
            const SizedBox(height: 20),
            if (_resultMessage != null)
              Text(
                _resultMessage!,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
