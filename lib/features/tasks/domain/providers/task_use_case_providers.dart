import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/providers/task_data_providers.dart';
import '../use_cases/get_tasks_use_case.dart';
import '../use_cases/add_task_use_case.dart';
import '../use_cases/update_task_use_case.dart';
import '../use_cases/delete_task_use_case.dart';

part 'task_use_case_providers.g.dart';

@riverpod
GetTasksUseCase getTasksUseCase(Ref ref) {
  final repository = ref.watch(getTaskRepositoryProvider);
  return GetTasksUseCase(repository);
}

@riverpod
AddTaskUseCase addTaskUseCase(Ref ref) {
  final repository = ref.watch(getTaskRepositoryProvider);
  return AddTaskUseCase(repository);
}

@riverpod
UpdateTaskUseCase updateTaskUseCase(Ref ref) {
  final repository = ref.watch(getTaskRepositoryProvider);
  return UpdateTaskUseCase(repository);
}

@riverpod
DeleteTaskUseCase deleteTaskUseCase(Ref ref) {
  final repository = ref.watch(getTaskRepositoryProvider);
  return DeleteTaskUseCase(repository);
}
