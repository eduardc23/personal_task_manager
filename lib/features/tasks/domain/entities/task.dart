import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';

/// Representa una tarea dentro del dominio de la aplicación.
///
/// Esta es la entidad de negocio principal, independiente de cualquier fuente de datos.
/// Es utilizada por los casos de uso y repositorios para implementar y manipular
/// la lógica de negocio relacionada con las tareas.
@freezed
abstract class Task with _$Task {
  const factory Task({
    /// Identificador único de la tarea.
    /// Es `null` cuando la tarea aún no ha sido persistida
    /// (por ejemplo, antes de guardarse por primera vez en el almacenamiento local).
    final int? id,
    required String title,
    required String description,
    @Default(false) bool isCompleted,
  }) = _Task;
}
