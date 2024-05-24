import 'dart:math';

int generateRandomPassword(int length) {
  final random = Random();
  const digits = '123456789';

  String password =
      List.generate(length, (index) => digits[random.nextInt(digits.length)])
          .join();
  return int.parse(password);
}
