import 'dart:math';

mixin GeneratePassword {
  /// Generates a random password with the given length
  static int generateRandomPassword(int length) {
    final random = Random();
    const digits = '123456789';

    final password = List.generate(
      length,
      (index) => digits[random.nextInt(digits.length)],
    ).join();
    return int.parse(password);
  }
}
