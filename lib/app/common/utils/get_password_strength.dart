
import 'package:lost_app/app/common/enums/password_strength.dart';

PasswordStrength? checkPasswordStrength(String value) {
  final password = value.trim();
  final numExp = RegExp('.*[0-9].*');
  final letterExp = RegExp('.*[A-Za-z].*');
  final symbolsExp = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
  int passwordStrength = 0;
  if (password.length > 5) {
    if (password.length > 7) passwordStrength++;
    if (letterExp.hasMatch(password)) passwordStrength++;
    if (numExp.hasMatch(password)) passwordStrength++;
    if (symbolsExp.hasMatch(password)) passwordStrength++;
  }
  if (passwordStrength == 0) {
    return null;
  } else if (passwordStrength == 1) {
    return PasswordStrength.weak;
  } else if (passwordStrength == 2) {
    return PasswordStrength.intermediate;
  } else if (passwordStrength == 3) {
    return PasswordStrength.strong;
  } else {
    return PasswordStrength.veryStrong;
  }
}
