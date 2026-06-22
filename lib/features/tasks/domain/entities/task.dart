import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';

@freezed
abstract class Task with _$Task {
  const factory Task({
    final int? id,
    required String title,
    required String description,
    @Default(false) bool isCompleted,
  }) = _Task;
}
