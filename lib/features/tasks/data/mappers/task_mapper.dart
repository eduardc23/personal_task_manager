import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../domain/entities/task.dart';

extension TaskEntryMapper on TasksEntry {
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
  TasksCompanion toCompanion() {
    return TasksCompanion(
      id: id == null ? const Value.absent() : Value(id!),
      title: Value(title),
      description: Value(description),
      isCompleted: Value(isCompleted),
    );
  }
}