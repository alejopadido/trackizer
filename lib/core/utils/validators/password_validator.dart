bool hasMinimumLength(String value) {
  return value.length >= 8;
}

bool hasUpperCase(String value) {
  return RegExp(r'[A-Z]').hasMatch(value);
}

bool hasLowerCase(String value) {
  return RegExp(r'[a-z]').hasMatch(value);
}

bool hasDigit(String value) {
  return RegExp(r'\d').hasMatch(value);
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) return 'This field is required';

  if (!hasMinimumLength(value))
    return 'Password must be at least 8 characters long';
  if (!hasUpperCase(value))
    return 'Password must include at least one uppercase letter';
  if (!hasLowerCase(value))
    return 'Password must include at least one lowercase letter';
  if (!hasDigit(value)) return 'Password must include at least one digit';

  return null;
}
