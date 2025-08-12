int add(String numbers) {
  if (numbers.isEmpty) return 0;

  String input = numbers;
  // default delimiter is comma — escape it for regex safety
  String delimiterPattern = RegExp.escape(',');

  // custom delimiter support: starts with //delimiter\n
  if (input.startsWith('//')) {
    final newlineIndex = input.indexOf('\n');
    if (newlineIndex == -1) {
      // malformed but we'll treat as empty numbers
      return 0;
    }
    final delimiter = input.substring(2, newlineIndex);
    delimiterPattern = RegExp.escape(delimiter); // escape any regex chars
    input = input.substring(newlineIndex + 1);
  }

  // Split by delimiter OR newline
  final parts = input.split(RegExp('$delimiterPattern|\\n'));

  final nums = parts
      .where((p) => p.trim().isNotEmpty)
      .map((p) => int.parse(p.trim()))
      .toList();

  final negatives = nums.where((n) => n < 0).toList();
  if (negatives.isNotEmpty) {
    throw Exception('negative numbers not allowed ${negatives.join(',')}');
  }

  return nums.isEmpty ? 0 : nums.reduce((a, b) => a + b);
}
