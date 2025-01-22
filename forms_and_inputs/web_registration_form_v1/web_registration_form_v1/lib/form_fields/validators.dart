typedef ValidatorFunction = String? Function(String? value);

String? requiredValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your name';
  }
  return null;
}

String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your email';
  }
  if (!value.contains('@')) {
    return 'Please enter a valid email';
  }
  return null;
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your password';
  }
  if (value.length < 6) {
    return 'Password must be at least 6 characters';
  }
  return null;
}

String? confirmPasswordValidator(String? value, String? password) {
  if (value == null || value.isEmpty) {
    return 'Please confirm your password';
  }
  if (value != password) {
    return 'Passwords do not match';
  }
  return null;
}

final Map<String, ValidatorFunction> validators = {
  'Name': requiredValidator,
  'Email': emailValidator,
  'Password': passwordValidator,
};
