import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_task_manager/core/constants/app_constants.dart';
import 'package:personal_task_manager/features/tasks/presentation/screens/task_detail/widgets/confirm_dialog.dart';
import '../../../../../core/error/failure_message_extension.dart';
import '../../../../../core/utils/context_extensions.dart';
import '../../providers/task_provider.dart';
import '../task_form/task_form_screen.dart';
import 'widgets/task_status_section.dart';

class TaskDetailScreen extends ConsumerWidget {
  final int taskId;

  const TaskDetailScreen({super.key, required this.taskId});

  Future<void> _confirmDelete(
    BuildContext context,
    WidgetRef ref,
    int taskId,
  ) async {
    final confirmed = await showConfirmationDialog(
      context,
      title: 'Delete task',
      content: 'Are you sure you want to delete this task?',
    );

    if (!confirmed || !context.mounted) return;

    await _deleteTask(context, ref, taskId);
  }

  Future<void> _deleteTask(
    BuildContext context,
    WidgetRef ref,
    int taskId,
  ) async {
    try {
      await ref.read(tasksProvider.notifier).deleteTask(taskId);

      if (!context.mounted) return;

      Navigator.pop(context);
    } catch (e) {
      if (!context.mounted) return;
      context.showErrorSnackBar(e);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final taskState = ref.watch(taskByIdProvider(taskId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Detail'),
        actions: [
          if (taskState.value != null)
            IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () => _confirmDelete(context, ref, taskId),
            ),
        ],
      ),

      body: taskState.when(
        data: (currentTask) {
          if (currentTask == null) {
            return const Center(child: Text('Task not found'));
          }

          return Container(
            decoration: BoxDecoration(color: theme.colorScheme.surface),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppConstants.paddingLarge),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currentTask.title,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: AppConstants.spacingLarge),
                  TaskStatusSection(task: currentTask),
                  const SizedBox(height: AppConstants.spacingLarge),
                  Text(
                    'Description',
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: theme.colorScheme.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: AppConstants.spacingSmall),
                  Text(
                    currentTask.description,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: currentTask.description.isEmpty
                          ? theme.colorScheme.outline
                          : null,
                    ),
                  ),
                  const SizedBox(height: AppConstants.spacingHuge),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => TaskFormScreen(task: currentTask),
                        ),
                      ),
                      label: const Text('Edit Task'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: theme.colorScheme.primary,
                        padding: const EdgeInsets.symmetric(
                          vertical: AppConstants.paddingMedium,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            AppConstants.borderRadiusLarge,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text(err.toUserMessage())),
      ),
    );
  }
}
