import '../../domain/entities/task.dart';
import '../../domain/repositories/task_repository.dart';
import '../data_sources/task_local_data_source.dart';
import '../mappers/task_mapper.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskLocalDataSource localDataSource;

  TaskRepositoryImpl(this.localDataSource);

  @override
  Future<List<Task>> getTasks() async {
    final models = await localDataSource.getTasks();
    return models.map((model) => model.toDomain()).toList();
  }

  @override
  Future<Task> addTask(Task task) async {
    final savedModel = await localDataSource.saveTask(task.toModel());
    return savedModel.toDomain();
  }

  @override
  Future<Task> updateTask(Task task) async {
    final savedModel = await localDataSource.saveTask(
      task.toModel(),
      id: task.id,
    );
    return savedModel.toDomain();
  }

  @override
  Future<void> deleteTask(int id) async {
    await localDataSource.deleteTask(id);
  }
}
