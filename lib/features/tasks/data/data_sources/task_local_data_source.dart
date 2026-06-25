import 'package:hive/hive.dart';
import '../models/task_model.dart';

abstract class TaskLocalDataSource {
  Future<List<TaskModel>> getTasks();
  Future<TaskModel> saveTask(TaskModel task, {int? id});
  Future<void> deleteTask(int taskId);
}

class TaskLocalDataSourceImpl implements TaskLocalDataSource {
  final Box<TaskModel> _box;

  TaskLocalDataSourceImpl(this._box);

  @override
  Future<List<TaskModel>> getTasks() async {
    return _box.keys.map((key) {
      final task = _box.get(key)!;
      return task.copyWith(id: key as int);
    }).toList();
  }

  @override
  Future<TaskModel> saveTask(TaskModel task, {int? id}) async {
    if (id != null) {
      await _box.put(id, task);
      return _box.get(id)!;
    } else {
      final key = await _box.add(task);
      return _box.get(key)!;
    }
  }


  @override
  Future<void> deleteTask(int taskId) async {
    await _box.delete(taskId);
  }
}


