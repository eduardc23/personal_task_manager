import '../../../../../../core/validators/validators.dart';

class TaskValidators {
  TaskValidators._();

  static String? title(String? value) {
    return Validators.compose([
      (v) => Validators.required(v, fieldName: 'field'),
      (v) => Validators.maxLength(v, 100, fieldName: 'field'),
    ], value);
  }

  static String? description(String? value) {
    return Validators.compose([
      (v) => Validators.required(v, fieldName: 'description'),
      (v) => Validators.maxLength(v, 1000, fieldName: 'description'),
    ], value);
  }
}
