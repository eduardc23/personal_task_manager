class Validators {
  Validators._();

  static String? compose(
    List<String? Function(String?)> validators,
    String? value,
  ) {
    for (final validator in validators) {
      final error = validator(value);
      if (error != null) return error;
    }
    return null;
  }

  static String? required(String? value, {String fieldName = 'field'}) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter a $fieldName';
    }
    return null;
  }

  static String? minLength(
    String? value,
    int min, {
    String fieldName = 'field',
  }) {
    if (value != null && value.trim().length < min) {
      return '$fieldName must be at least $min characters long';
    }
    return null;
  }

  static String? maxLength(
    String? value,
    int max, {
    String fieldName = 'field',
  }) {
    if (value != null && value.trim().length > max) {
      return '$fieldName cannot exceed $max characters';
    }
    return null;
  }
}
