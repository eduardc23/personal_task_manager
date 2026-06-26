import '../../domain/entities/task.dart';
import '../models/task_model.dart';

/// Converts between [TaskModel] (data layer) and [Task] (domain entity).
///
/// This separation keeps the domain entity independent of persistence
/// details and data source implementations.
extension TaskModelMapper on TaskModel {
  /// Converts this [TaskModel] into a domain [Task] entity.
  Task toDomain() {
    return Task(
      id: id,
      title: title,
      description: description,
      isCompleted: isCompleted,
    );
  }
}

/// Extension methods for converting [Task] into [TaskModel].
extension TaskMapper on Task {
  /// Converts this [Task] entity into a [TaskModel] ready for persistence.
  TaskModel toModel() {
    return TaskModel(
      id: id,
      title: title,
      description: description,
      isCompleted: isCompleted,
    );
  }
}
