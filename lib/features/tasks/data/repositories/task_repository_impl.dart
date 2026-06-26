import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/task.dart';
import '../../domain/repositories/task_repository.dart';
import '../data_sources/task_local_data_source.dart';
import '../mappers/task_mapper.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskLocalDataSource localDataSource;

  TaskRepositoryImpl(this.localDataSource);

  @override
  List<Task> getTasks() {
    try {
      final models = localDataSource.getTasks();
      return models.map((model) => model.toDomain()).toList();
    } on CacheException catch (e) {
      throw CacheFailure(e.message);
    }
  }

  @override
  Future<Task> addTask(Task task) async {
    try {
      final savedModel = await localDataSource.createTask(task.toModel());
      return savedModel.toDomain();
    } on CacheException catch (e) {
      throw CacheFailure(e.message);
    }
  }

  @override
  Future<Task> updateTask(Task task, int id) async {
    try {
      final savedModel = await localDataSource.updateTask(task.toModel(), id);
      return savedModel.toDomain();
    } on CacheException catch (e) {
      throw CacheFailure(e.message);
    }
  }

  @override
  Future<void> deleteTask(int id) async {
    try {
      await localDataSource.deleteTask(id);
    } on CacheException catch (e) {
      throw CacheFailure(e.message);
    }
  }
}
