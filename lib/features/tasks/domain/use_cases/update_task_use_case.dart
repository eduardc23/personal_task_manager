import '../../../../core/error/failures.dart';
import '../entities/task.dart';
import '../repositories/task_repository.dart';

class UpdateTaskUseCase {
  final TaskRepository repository;

  UpdateTaskUseCase(this.repository);

  Future<Task> call(Task task) async {
    final id = task.id;
    if (id == null) {
      throw const ValidationFailure('You cannot update a task without an ID');
    }

    return await repository.updateTask(task, id);
  }
}
