import '../entities/task.dart';
import '../use_cases/task_use_cases.dart';

class TaskFacade {
  final GetTasksUseCase _getTasks;
  final AddTaskUseCase _addTask;
  final UpdateTaskUseCase _updateTask;
  final DeleteTaskUseCase _deleteTask;

  TaskFacade({
    required GetTasksUseCase getTasks,
    required AddTaskUseCase addTask,
    required UpdateTaskUseCase updateTask,
    required DeleteTaskUseCase deleteTask,
  }) : _getTasks = getTasks,
       _addTask = addTask,
       _updateTask = updateTask,
       _deleteTask = deleteTask;

  List<Task> getTasks() => _getTasks();

  Future<Task> addTask(Task task) => _addTask(task);

  Future<Task> updateTask(Task task) => _updateTask(task);

  Future<void> deleteTask(int id) => _deleteTask(id);
}
