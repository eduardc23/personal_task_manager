import 'package:drift/drift.dart';
import 'package:personal_task_manager/core/database/tables/task_table.dart';
import '../../../../core/database/app_database.dart';

abstract class TaskLocalDataSource {
  Future<List<TasksEntry>> getTasks();

  Future<void> saveTask(TasksCompanion task);

  Future<void> deleteTask(int taskId);

  Future<TasksEntry?> getTask(int taskId);
}

class TaskLocalDataSourceImpl implements TaskLocalDataSource {
  final AppDatabase _db;

  TaskLocalDataSourceImpl(this._db);

  @override
  Future<List<TasksEntry>> getTasks() async {
    return _db.select(_db.tasks).get();
  }

  @override
  Future<void> saveTask(TasksCompanion task) async {
    await _db.into(_db.tasks).insertOnConflictUpdate(task);
  }

  @override
  Future<void> deleteTask(int taskId) async {
    await (_db.delete(_db.tasks)..where((t) => t.id.equals(taskId))).go();
  }

  @override
  Future<TasksEntry?> getTask(int taskId) async {
    return (_db.select(
      _db.tasks,
    )..where((t) => t.id.equals(taskId))).getSingleOrNull();
  }
}
