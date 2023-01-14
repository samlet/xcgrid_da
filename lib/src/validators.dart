
import 'package:validators/validators.dart';

class MoreFieldBlocValidators {
  MoreFieldBlocValidators._();

  static String? min6Chars(String? string) {
    if (string == null || string.isEmpty || string.runes.length >= 6) {
      return null;
    }
    return MoreFieldBlocValidatorsErrors.min6Chars;
  }
  static String? min4Chars(String? string) {
    if (string == null || string.isEmpty || string.runes.length >= 6) {
      return null;
    }
    return MoreFieldBlocValidatorsErrors.min4Chars;
  }

  static String? max20Chars(String? string) {
    if (string == null || string.isEmpty || string.runes.length <= 20) {
      return null;
    }
    return MoreFieldBlocValidatorsErrors.max20Chars;
  }

  static String? max22Chars(String? string) {
    if (string == null || string.isEmpty || string.runes.length <= 22) {
      return null;
    }
    return MoreFieldBlocValidatorsErrors.max22Chars;
  }

  static String? max100Chars(String? string) {
    if (string == null || string.isEmpty || string.runes.length <= 100) {
      return null;
    }
    return MoreFieldBlocValidatorsErrors.max100Chars;
  }

  static String? url(String? string) {
    if (string == null || string.isEmpty || isURL(string, requireTld: true)) {
      return null;
    }
    return MoreFieldBlocValidatorsErrors.url;
  }

  static String? numeric(String? string) {
    if (string == null || string.isEmpty || isNumeric(string)) {
      return null;
    }
    return MoreFieldBlocValidatorsErrors.numeric;
  }

  static String? decimal(String? string) {
    if (string == null || string.isEmpty || isFloat(string)) {
      return null;
    }
    return MoreFieldBlocValidatorsErrors.decimal;
  }

  static String? date(String? string) {
    if (string == null || string.isEmpty || isDate(string)) {
      return null;
    }
    return MoreFieldBlocValidatorsErrors.date;
  }

  static String? creditCard(String? string) {
    if (string == null || string.isEmpty || isCreditCard(string)) {
      return null;
    }
    return MoreFieldBlocValidatorsErrors.creditCard;
  }

  static String? email(String? string) {
    final emailRegExp =
    RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');
    if (string == null || string.isEmpty || emailRegExp.hasMatch(string)) {
      return null;
    }

    return MoreFieldBlocValidatorsErrors.email;
  }

  static String? tel(String? string) {
    final regExp = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
    if (string == null || string.isEmpty || regExp.hasMatch(string)) {
      return null;
    }

    return MoreFieldBlocValidatorsErrors.tel;
  }
}

class MoreFieldBlocValidatorsErrors {
  MoreFieldBlocValidatorsErrors._();

  static const String min6Chars = 'Min 6 Chars - Validator Error';
  static const String min4Chars = 'Min 4 Chars - Validator Error';
  static const String max20Chars = 'Max 20 Chars - Validator Error';
  static const String max22Chars = 'Max 22 Chars - Validator Error';
  static const String max100Chars = 'Max 100 Chars - Validator Error';
  static const String url = 'Url - Validator Error';
  static const String numeric = 'Numeric - Validator Error';
  static const String decimal = 'Decimal - Validator Error';
  static const String date = 'Date - Validator Error';
  static const String creditCard = 'Credit card - Validator Error';
  static const String tel = 'Tel - Validator Error';
  static const String email = 'Email - Validator Error';
}
