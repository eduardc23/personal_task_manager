import 'package:drift/drift.dart';
import '../../domain/entities/task.dart';
import '../../domain/repositories/task_repository.dart';
import '../data_sources/task_local_data_source.dart';
import '../../../../core/database/app_database.dart';
import '../mappers/task_mapper.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskLocalDataSource localDataSource;

  TaskRepositoryImpl(this.localDataSource);

  @override
  Future<List<Task>> getTasks() async {
    final entries = await localDataSource.getTasks();
    return entries.map((e) => e.toDomain()).toList();
  }

  @override
  Future<void> addTask(Task task) async {
    await localDataSource.saveTask(task.toCompanion());
  }

  @override
  Future<void> updateTask(Task task) async {
    await localDataSource.saveTask(task.toCompanion());
  }

  @override
  Future<void> deleteTask(int id) async {
    await localDataSource.deleteTask(id);
  }

  @override
  Future<Task?> getTaskById(int id) async {
    final entry = await localDataSource.getTask(id);
    return entry?.toDomain();
  }
}
