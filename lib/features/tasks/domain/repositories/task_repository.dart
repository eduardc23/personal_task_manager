import '../entities/task.dart';

abstract class TaskRepository {
  List<Task> getTasks();

  Future<Task> addTask(Task task);

  Future<Task> updateTask(Task task, int id);

  Future<void> deleteTask(int id);
}
