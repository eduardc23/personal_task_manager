import '../repositories/task_repository.dart';

class DeleteTaskUseCase {
  final TaskRepository _repository;

  DeleteTaskUseCase(this._repository);

  Future<void> call(int id) {
    return _repository.deleteTask(id);
  }
}
