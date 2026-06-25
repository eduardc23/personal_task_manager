import 'package:hive/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../constants/app_constants.dart';
import '../../../features/tasks/data/models/task_model.dart';

part 'database_provider.g.dart';

@riverpod
Box<TaskModel> taskBox(Ref ref) {
  return Hive.box<TaskModel>(AppConstants.taskBoxName);
}
