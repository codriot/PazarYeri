import 'package:flutter/material.dart';

mixin CardUtils {
  static CardType getCardTypeFrmNumber(String input) {
    CardType cardType;
    if (input.startsWith(
      RegExp(
        '((5[1-5])|(222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720))',
      ),
    )) {
      cardType = CardType.Master;
    } else if (input.startsWith(RegExp('[4]'))) {
      cardType = CardType.Visa;
    } else if (input.startsWith(RegExp('((506(0|1))|(507(8|9))|(6500))'))) {
      cardType = CardType.Verve;
    } else if (input.startsWith(RegExp('((34)|(37))'))) {
      cardType = CardType.AmericanExpress;
    } else if (input.length <= 8) {
      cardType = CardType.Others;
    } else {
      cardType = CardType.Invalid;
    }
    return cardType;
  }

  static Widget? getCardIcon(CardType? cardType) {
    var img = '';
    Icon? icon;
    switch (cardType) {
      case CardType.Master:
        img = 'mastercard.png';
      case CardType.Visa:
        img = 'Visa.png';
      case CardType.Verve:
        img = 'Verve.png';
      case CardType.AmericanExpress:
        img = 'AmericanExpress.png';

      case CardType.Others:
        icon = const Icon(
          Icons.credit_card,
          size: 24,
          color: Color(0xFFB8B5C3),
        );
      default:
        icon = const Icon(
          Icons.warning,
          size: 24,
          color: Color(0xFFB8B5C3),
        );
        break;
    }
    Widget? widget;
    if (img.isNotEmpty) {
      widget = Image.asset(
        'assets/images/$img',
        width: 40,
      );
    } else {
      widget = icon;
    }
    return widget;
  }

  static String getCleanedNumber(String text) {
    final regExp = RegExp('[^0-9]');
    return text.replaceAll(regExp, '');
  }

  /// With the card number with Luhn Algorithm
  /// https://en.wikipedia.org/wiki/Luhn_algorithm
  static String? validateCardNum(String? input) {
    if (input == null || input.isEmpty) {
      return 'This field is required';
    }
    input = getCleanedNumber(input);
    if (input.length < 8) {
      return 'Card is invalid';
    }
    var sum = 0;
    final length = input.length;
    for (var i = 0; i < length; i++) {
      // get digits in reverse order
      var digit = int.parse(input[length - i - 1]);
// every 2nd number multiply with 2
      if (i % 2 == 1) {
        digit *= 2;
      }
      sum += digit > 9 ? (digit - 9) : digit;
    }
    if (sum % 10 == 0) {
      return null;
    }
    return 'Card is invalid';
  }

  static String? validateCVV(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    if (value.length < 3 || value.length > 4) {
      return 'CVV is invalid';
    }
    return null;
  }

  static String? validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    int year;
    int month;
    if (value.contains(RegExp('(/)'))) {
      final split = value.split(RegExp('(/)'));

      month = int.parse(split[0]);
      year = int.parse(split[1]);
    } else {
      month = int.parse(value.substring(0, value.length));
      year = -1; // Lets use an invalid year intentionally
    }
    if ((month < 1) || (month > 12)) {
      // A valid month is between 1 (January) and 12 (December)
      return 'Expiry month is invalid';
    }
    final fourDigitsYear = convertYearTo4Digits(year);
    if ((fourDigitsYear < 1) || (fourDigitsYear > 2099)) {
      // We are assuming a valid should be between 1 and 2099.
      // Note that, it's valid doesn't mean that it has not expired.
      return 'Expiry year is invalid';
    }
    if (!hasDateExpired(month, year)) {
      return 'Card has expired';
    }
    return null;
  }

  /// Convert the two-digit year to four-digit year if necessary
  static int convertYearTo4Digits(int year) {
    if (year < 100 && year >= 0) {
      final now = DateTime.now();
      final currentYear = now.year.toString();
      final prefix = currentYear.substring(0, currentYear.length - 2);
      year = int.parse('$prefix${year.toString().padLeft(2, '0')}');
    }
    return year;
  }

  static bool hasDateExpired(int month, int year) {
    return isNotExpired(year, month);
  }

  static bool isNotExpired(int year, int month) {
    // It has not expired if both the year and date has not passed
    return !hasYearPassed(year) && !hasMonthPassed(year, month);
  }

  static List<int> getExpiryDate(String value) {
    final split = value.split(RegExp('(/)'));
    return [int.parse(split[0]), int.parse(split[1])];
  }

  static bool hasMonthPassed(int year, int month) {
    final now = DateTime.now();
    // The month has passed if:
    // 1. The year is in the past. In that case, we just assume that the month
    // has passed
    // 2. Card's month (plus another month) is more than current month.
    return hasYearPassed(year) ||
        convertYearTo4Digits(year) == now.year && (month < now.month + 1);
  }

  static bool hasYearPassed(int year) {
    final fourDigitsYear = convertYearTo4Digits(year);
    final now = DateTime.now();
    // The year has passed if the year we are currently is more than card's
    // year
    return fourDigitsYear < now.year;
  }
}

enum CardType {
  Master,
  Visa,
  Verve,
  Discover,
  AmericanExpress,
  DinersClub,
  Jcb,
  Others,
  Invalid
}
