import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_model.freezed.dart';

/// Data model that represents a task as it is stored in the local data source.
///
/// Unlike [Task] (the domain entity), this model belongs to the data layer
/// and is used exclusively for persistence and mapping to and from [Task].
@freezed
abstract class TaskModel with _$TaskModel {
  const factory TaskModel({
    /// Unique identifier assigned when the task is persisted.
    ///
    /// It is `null` before the task is stored for the first time.
    int? id,
    required String title,
    required String description,
    @Default(false) bool isCompleted,
  }) = _TaskModel;
}
