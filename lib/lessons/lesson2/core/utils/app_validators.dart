class AppValidators {
  // функция валидаций email

  static String? emailValidate(String? value) {
    if (value == null || value.isEmpty) {
      return "email не должен быть пустым !";
    }

    final emailRegular = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );

    // проверка

    if (!value.contains("@")) {
      return "email должен соддержать символ @";
    }

    if (!emailRegular.hasMatch(value)) {
      return "Неверный формат email (пример: user@mail.com)";
    }

    return null;
  }

  // функция валидаций номер телефона

  static String? phoneNumberValidate(String? value) {
    if (value == null || value.isEmpty) {
      return "Введите номер телефона";
    } else if (value.length != 10) {
      return "Номер телефона должен соддержать 10 цифр";
    }
    return null;
  }

  // функция валидаций password
  static String? passwordValidate(String? value) {
    if (value == null || value.isEmpty) {
      return "Введите пароль !";
    }
    return null;
  }
}
