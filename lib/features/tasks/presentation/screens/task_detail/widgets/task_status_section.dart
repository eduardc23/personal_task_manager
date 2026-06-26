import 'package:flutter/material.dart';
import '../../../../../../core/constants/app_constants.dart';
import '../../../../domain/entities/task.dart';

class TaskStatusSection extends StatelessWidget {
  final Task task;

  const TaskStatusSection({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Status',
          style: theme.textTheme.titleSmall?.copyWith(
            color: theme.colorScheme.secondary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: AppConstants.spacingSmall),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.paddingSmall,
            vertical: 4,
          ),
          decoration: BoxDecoration(
            color: task.isCompleted
                ? theme.colorScheme.primaryContainer
                : theme.colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(
              AppConstants.borderRadiusSmall,
            ),
          ),
          child: Text(
            task.isCompleted ? 'COMPLETED' : 'PENDING',
            style: theme.textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: task.isCompleted
                  ? theme.colorScheme.onPrimaryContainer
                  : theme.colorScheme.onSurfaceVariant,
              letterSpacing: 1.2,
            ),
          ),
        ),
      ],
    );
  }
}
