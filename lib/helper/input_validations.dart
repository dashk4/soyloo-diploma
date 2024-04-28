/// @author mmunkhsuld

class InputValidations {
  static String? passwordValidation(String text) {
    if (text.toString().isEmpty) {
      return "Нууц үгээ оруулна уу";
    }
    if (text.toString().length < 4) {
      return "4 аас дээш урттай оруулна уу";
    }
    return null;
  }

  static String? pinValidation(String text) {
    if (text.toString().isEmpty) {
      return "Пин кодоо оруулна уу";
    }
    if (text.toString().length != 4) {
      return "4 урттай тоо оруулна уу";
    }
    return null;
  }

  static String? phoneValidation(String text, {String? oldPhone}) {
    if (text.toString().isEmpty) {
      return "Утасны дугаараа оруулна уу";
    }
    if (text.toString().length != 8) {
      return "8 оронтой тоо оруулна уу";
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(text)) {
      return "8 оронтой тоо оруулна уу";
    }

    if (oldPhone != null) {
      if (text == oldPhone) {
        return "Шинэ дугаар оруулна уу";
      }
    }
    return null;
  }

  static String? registrationValidation(String text) {
    if (text.toString().isEmpty) {
      return "Регистрийн дугаараа оруулна уу";
    }
    if (text.toString().length != 8) {
      return "8 оронтой тоо оруулна уу";
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(text)) {
      return "8 оронтой тоо оруулна уу";
    }
    return null;
  }

  static String? fieldValidation(String text) {
    if (text.toString().isEmpty) {
      return "Талбар хоосон байна";
    }
    return null;
  }

  static String? usernameValidation(String text) {
    if (text.toString().isEmpty) {
      return "Талбар хоосон байна";
    }

    if (text.toString().length <= 4) {
      return "4-өөс дээш тэмдэгт оруулна уу";
    }
    return null;
  }

  static String? orgRegisterValidation(String text) {
    if (text.toString().isEmpty) {
      return "Регистрийн дугаараа оруулна уу";
    }
    if (text.toString().length != 7) {
      return "7 оронтой тоо оруулна уу";
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(text)) {
      return "7 оронтой тоо оруулна уу";
    }
    return null;
  }

  static String? numberValidation(String text) {
    if (text.toString().isEmpty) {
      return "Талбар хоосон байна";
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(text)) {
      return "Тоо оруулна уу";
    }
    return null;
  }

  static String? emailValidation(String text, {String? oldEmail}) {
    if (oldEmail != null) {
      if (text == oldEmail) {
        return "Шинэ и-мэйл хаяг оруулна уу";
      }
    }
    if (text.toString().isEmpty) {
      return "Талбар хоосон байна";
    }
    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(text)) {
      return "Буруу форматтай байна";
    }
    return null;
  }
}
