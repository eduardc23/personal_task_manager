import 'package:hive/hive.dart';
import '../../../../core/error/exceptions.dart';
import '../models/task_model.dart';

abstract class TaskLocalDataSource {
  List<TaskModel> getTasks();

  Future<TaskModel> createTask(TaskModel task);

  Future<TaskModel> updateTask(TaskModel task, int id);

  Future<void> deleteTask(int taskId);
}

class TaskLocalDataSourceImpl implements TaskLocalDataSource {
  final Box<TaskModel> _storage;

  TaskLocalDataSourceImpl(this._storage);

  @override
  List<TaskModel> getTasks() {
    try {
      return _storage.keys.map((key) {
        final task = _storage.get(key);
        if (task == null) {
          throw const CacheException('Task corrupted or deleted');
        }
        return task.copyWith(id: key as int);
      }).toList();
    } on HiveError catch (e) {
      throw CacheException(e.message);
    }
  }

  @override
  Future<TaskModel> createTask(TaskModel task) async {
    try {
      final key = await _storage.add(task);
      final saved = _storage.get(key);
      if (saved == null) {
        throw const CacheException('Failed to create task');
      }
      return saved.copyWith(id: key);
    } on HiveError catch (e) {
      throw CacheException(e.message);
    }
  }

  @override
  Future<TaskModel> updateTask(TaskModel task, int id) async {
    try {
      await _storage.put(id, task);
      final saved = _storage.get(id);
      if (saved == null) {
        throw const CacheException('Failed to update task');
      }
      return saved.copyWith(id: id);
    } on HiveError catch (e) {
      throw CacheException(e.message);
    }
  }

  @override
  Future<void> deleteTask(int taskId) async {
    try {
      await _storage.delete(taskId);
    } on HiveError catch (e) {
      throw CacheException(e.message);
    }
  }
}
