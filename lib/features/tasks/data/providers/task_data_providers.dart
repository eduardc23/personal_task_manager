import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/database/providers/database_provider.dart';
import '../data_sources/task_local_data_source.dart';
import '../repositories/task_repository_impl.dart';
import '../../domain/repositories/task_repository.dart';

part 'task_data_providers.g.dart';

@riverpod
TaskLocalDataSource getTaskLocalDataSource(Ref ref) {
  final storage = ref.watch(getTaskStorageProvider);
  return TaskLocalDataSourceImpl(storage);
}

@riverpod
TaskRepository getTaskRepository(Ref ref) {
  final localDataSource = ref.watch(getTaskLocalDataSourceProvider);
  return TaskRepositoryImpl(localDataSource);
}