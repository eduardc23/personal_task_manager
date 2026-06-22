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
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final newTask = Task(title: title, description: description);
      await ref.read(addTaskUseCaseProvider).execute(newTask);
      ref.invalidateSelf();
      return future;
    });
  }

  Future<void> updateTask(Task task) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(updateTaskUseCaseProvider).execute(task);
      ref.invalidateSelf();
      return future;
    });
  }

  Future<void> deleteTask(int id) async {
    state = await AsyncValue.guard(() async {
      await ref.read(deleteTaskUseCaseProvider).execute(id);
      ref.invalidateSelf();
      return future;
    });
  }

  Future<void> toggleTaskStatus(Task task) async {
    state = await AsyncValue.guard(() async {
      final updatedTask = task.copyWith(isCompleted: !task.isCompleted);
      await ref.read(updateTaskUseCaseProvider).execute(updatedTask);
      ref.invalidateSelf();
      return future;
    });
  }
}
