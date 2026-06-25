import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/task.dart';
import '../../domain/providers/task_domain_providers.dart';

part 'task_provider.g.dart';

@riverpod
class TaskList extends _$TaskList {
  @override
  FutureOr<List<Task>> build() async {
    return ref.watch(getTasksUseCaseProvider).execute();
  }

  Future<void> addTask(String title, String description) async {
    final currentTasks = state.value ?? [];
    state = await AsyncValue.guard(() async {
      final newTask = Task(title: title, description: description);
      final createdTask = await ref
          .read(addTaskUseCaseProvider)
          .execute(newTask);
      return [...currentTasks, createdTask];
    });
  }

  Future<void> updateTask(Task task) async {
    final currentTasks = state.value ?? [];
    state = await AsyncValue.guard(() async {
      final updatedTask = await ref
          .read(updateTaskUseCaseProvider)
          .execute(task);
      return currentTasks
          .map((t) => t.id == task.id ? updatedTask : t)
          .toList();
    });
  }

  Future<void> deleteTask(int id) async {
    final currentTasks = state.value ?? [];
    state = await AsyncValue.guard(() async {
      await ref.read(deleteTaskUseCaseProvider).execute(id);
      return currentTasks.where((task) => task.id != id).toList();
    });
  }

  Future<void> toggleTaskStatus(Task task) async {
    final currentTasks = state.value ?? [];
    final toggled = task.copyWith(isCompleted: !task.isCompleted);

    state = await AsyncValue.guard(() async {
      final updatedTask = await ref
          .read(updateTaskUseCaseProvider)
          .execute(toggled);
      return currentTasks
          .map((t) => t.id == task.id ? updatedTask : t)
          .toList();
    });
  }
}
