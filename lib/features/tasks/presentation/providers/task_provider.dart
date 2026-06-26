import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/task.dart';
import '../../domain/providers/task_facade_providers.dart';

part 'task_provider.g.dart';

@riverpod
class TasksNotifier extends _$TasksNotifier {
  @override
  FutureOr<List<Task>> build() async {
    return ref.watch(taskFacadeProvider).getTasks();
  }

  Future<void> addTask(String title, String description) async {
    final currentTasks = state.value ?? [];
    final newTask = Task(title: title, description: description);
    final createdTask = await ref.read(taskFacadeProvider).addTask(newTask);
    state = AsyncData([...currentTasks, createdTask]);
  }

  Future<void> updateTask(Task task) async {
    final currentTasks = state.value ?? [];
    final updatedTask = await ref.read(taskFacadeProvider).updateTask(task);
    state = AsyncData(
      currentTasks.map((t) => t.id == task.id ? updatedTask : t).toList(),
    );
  }

  Future<void> deleteTask(int id) async {
    final currentTasks = state.value ?? [];
    await ref.read(taskFacadeProvider).deleteTask(id);
    state = AsyncData(currentTasks.where((task) => task.id != id).toList());
  }

  Future<void> toggleTaskStatus(Task task) async {
    final currentTasks = state.value ?? [];
    final toggled = task.copyWith(isCompleted: !task.isCompleted);
    final updatedTask = await ref.read(taskFacadeProvider).updateTask(toggled);
    state = AsyncData(
      currentTasks.map((t) => t.id == task.id ? updatedTask : t).toList(),
    );
  }
}

@riverpod
AsyncValue<Task?> taskById(Ref ref, int id) {
  final tasks = ref.watch(tasksProvider);

  return tasks.whenData(
    (tasks) => tasks.where((task) => task.id == id).firstOrNull,
  );
}
