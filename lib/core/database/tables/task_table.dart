import 'package:drift/drift.dart';

@DataClassName('TasksEntry')
class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text().withLength(min: 1, max: 100)();

  TextColumn get description => text().withLength(min: 1, max: 1000)();

  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();

}
