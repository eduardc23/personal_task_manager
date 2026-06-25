import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/database/providers/database_provider.dart';
import '../data_sources/task_local_data_source.dart';
import '../repositories/task_repository_impl.dart';
import '../../domain/repositories/task_repository.dart';

part 'task_data_providers.g.dart';

@riverpod
TaskLocalDataSource taskLocalDataSource(Ref ref) {
  final box = ref.watch(taskBoxProvider);
  return TaskLocalDataSourceImpl(box);
}

@riverpod
TaskRepository taskRepository(Ref ref) {
  final localDataSource = ref.watch(taskLocalDataSourceProvider);
  return TaskRepositoryImpl(localDataSource);
}
