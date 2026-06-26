import '../../../../../../core/constants/app_constants.dart';
import '../../../../../../core/validators/validators.dart';

class TaskValidators {
  static String? title(String? value) {
    return Validators.compose([
      (v) => Validators.required(v, fieldName: 'title'),
      (v) => Validators.maxLength(
        v,
        AppConstants.taskTitleMaxLength,
        fieldName: 'title',
      ),
    ], value);
  }

  static String? description(String? value) {
    return Validators.compose([
      (v) => Validators.required(v, fieldName: 'description'),
      (v) => Validators.maxLength(
        v,
        AppConstants.taskDescriptionMaxLength,
        fieldName: 'description',
      ),
    ], value);
  }
}
