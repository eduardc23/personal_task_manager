import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_model.freezed.dart';

@freezed
abstract class TaskModel with _$TaskModel {
  const factory TaskModel({
    int? id,
    required String title,
    required String description,
    @Default(false) bool isCompleted,
  }) = _TaskModel;
}
