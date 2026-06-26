import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_model.freezed.dart';

/// Modelo de datos que representa una tarea tal como se almacena en la fuente de datos local.
///
/// A diferencia de [Task] (la entidad de dominio), este modelo pertenece a la capa de datos
/// y se utiliza exclusivamente para la persistencia y el mapeo hacia y desde [Task].
@freezed
abstract class TaskModel with _$TaskModel {
  const factory TaskModel({
    /// Identificador único asignado cuando se persiste la tarea.
    ///
    /// Es `null` antes de que la tarea se guarde por primera vez.
    int? id,
    required String title,
    required String description,
    @Default(false) bool isCompleted,
  }) = _TaskModel;
}
