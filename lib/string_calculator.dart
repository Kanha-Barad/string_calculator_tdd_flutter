int add(String numbers) {
  if (numbers.isEmpty) return 0;
  final normalized = numbers.replaceAll('\n', ',');
  final parts = normalized.split(',');
  final nums = parts.map((p) => int.parse(p.trim())).toList();
  return nums.reduce((a, b) => a + b);
}
