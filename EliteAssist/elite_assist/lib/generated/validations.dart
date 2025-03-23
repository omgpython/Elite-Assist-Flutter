class Validations {
  static final _nameRegEx = RegExp(r'^[a-zA-Z\s]+$');
  static final _emailRegEx =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  static final _passwordRegEx = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$');

  static bool isValidName(String name) {
    return _nameRegEx.hasMatch(name);
  }

  static bool isValidEmail(String email) {
    return _emailRegEx.hasMatch(email);
  }

  static bool isValidPassword(String password) {
    return _passwordRegEx.hasMatch(password);
  }

  static bool isValidContact(String contact) {
    return contact.length == 10;
  }
}
