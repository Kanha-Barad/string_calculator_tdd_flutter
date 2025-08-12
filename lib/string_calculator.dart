int add(String numbers) {
  if (numbers.isEmpty) return 0;
  final parts = numbers.split(RegExp('[,\\n]'));
  final nums = parts.where((p) => p.trim().isNotEmpty)
      .map((p) => int.parse(p.trim()))
      .toList();
  return nums.isEmpty ? 0 : nums.reduce((a, b) => a + b);
}
