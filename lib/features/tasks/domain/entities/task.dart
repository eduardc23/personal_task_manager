import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';

/// Represents a task within the application's domain.
///
/// This is the core business entity, independent of any data source
/// It is used by use cases and repositories to implement and manipulate
/// task-related business logic.
@freezed
abstract class Task with _$Task {
  const factory Task({
    /// Unique task identifier.
    /// Is `null` when the task has not yet been persisted
    /// (for example, before being saved for the first time to local storage).
    final int? id,
    required String title,
    required String description,
    @Default(false) bool isCompleted,
  }) = _Task;
}
