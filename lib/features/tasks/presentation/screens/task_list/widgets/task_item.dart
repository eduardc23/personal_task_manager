import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_task_manager/core/constants/app_constants.dart';
import '../../../../domain/entities/task.dart';
import '../../../providers/task_provider.dart';
import '../../task_detail/task_detail_screen.dart';

class TaskItem extends ConsumerWidget {
  final Task task;

  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Dismissible(
      key: Key('task_${task.id}'),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: AppConstants.spacingLarge),
        decoration: BoxDecoration(
          color: Colors.redAccent.shade100,
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
        ),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (_) {
        final id = task.id;
        if (id != null) {
          ref.read(tasksProvider.notifier).deleteTask(id);
        }
      },
      child: Card(
        color: task.isCompleted
            ? theme.colorScheme.surfaceContainerHighest.withValues(alpha:
                AppConstants.opacityHalf,
              )
            : theme.colorScheme.surfaceContainerLow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
          side: BorderSide(
            color: task.isCompleted
                ? Colors.transparent
                : theme.colorScheme.outlineVariant,
            width: AppConstants.borderSideWidth,
          ),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
          onTap: () {
            final id = task.id;
            if (id != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => TaskDetailScreen(taskId: id),
                ),
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppConstants.paddingSmall,
            ),
            child: ListTile(
              leading: Transform.scale(
                scale: AppConstants.checkboxScale,
                child: Checkbox(
                  value: task.isCompleted,
                  activeColor: theme.colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      AppConstants.borderRadiusSmall,
                    ),
                  ),
                  onChanged: (_) {
                    ref.read(tasksProvider.notifier).toggleTaskStatus(task);
                  },
                ),
              ),
              title: Text(
                task.title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  decoration:
                      task.isCompleted ? TextDecoration.lineThrough : null,
                  color: task.isCompleted
                      ? theme.colorScheme.outline
                      : theme.colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                task.description,
                maxLines: AppConstants.summaryMaxLines,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyMedium?.copyWith(
                  decoration:
                      task.isCompleted ? TextDecoration.lineThrough : null,
                  color: task.isCompleted
                      ? theme.colorScheme.outline
                      : theme.colorScheme.onSurfaceVariant,
                ),
              ),
              trailing: const Icon(
                Icons.chevron_right,
                size: AppConstants.iconSizeSmall,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
