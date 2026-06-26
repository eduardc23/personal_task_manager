import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../facades/task_facade.dart';
import 'task_use_case_providers.dart';

part 'task_facade_providers.g.dart';

@riverpod
TaskFacade taskFacade(Ref ref) {
  return TaskFacade(
    getTasks: ref.watch(getTasksUseCaseProvider),
    addTask: ref.watch(addTaskUseCaseProvider),
    updateTask: ref.watch(updateTaskUseCaseProvider),
    deleteTask: ref.watch(deleteTaskUseCaseProvider),
  );
}
