import '../../domain/entities/task.dart';
import '../models/task_model.dart';

extension TaskModelMapper on TaskModel {
  Task toDomain() {
    return Task(
      id: id,
      title: title,
      description: description,
      isCompleted: isCompleted,
    );
  }
}

extension TaskMapper on Task {
  TaskModel toModel() {
    return TaskModel(
      id: id,
      title: title,
      description: description,
      isCompleted: isCompleted,
    );
  }
}