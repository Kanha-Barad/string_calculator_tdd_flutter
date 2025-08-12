int add(String numbers) {
  if (numbers.isEmpty) return 0;

  String input = numbers;
  String delimiterPattern = RegExp.escape(',');

  if (input.startsWith('//')) {
    final newlineIndex = input.indexOf('\n');
    if (newlineIndex == -1) return 0;
    final delimiter = input.substring(2, newlineIndex);
    delimiterPattern = RegExp.escape(delimiter);
    input = input.substring(newlineIndex + 1);
  }

  final parts = input.split(RegExp('$delimiterPattern|\\n'));
  final nums = parts.where((p) => p.trim().isNotEmpty)
      .map((p) => int.parse(p.trim()))
      .toList();

  return nums.isEmpty ? 0 : nums.reduce((a, b) => a + b);
}
