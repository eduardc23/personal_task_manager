import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_task_manager/core/constants/app_constants.dart';
import 'package:personal_task_manager/features/tasks/presentation/screens/task_form/validators/task_validators.dart';
import '../../../domain/entities/task.dart';
import '../../providers/task_provider.dart';
import 'widgets/task_text_field.dart';

class TaskFormScreen extends ConsumerStatefulWidget {
  final Task? task;

  const TaskFormScreen({super.key, this.task});

  @override
  ConsumerState<TaskFormScreen> createState() => _TaskFormScreenState();
}

class _TaskFormScreenState extends ConsumerState<TaskFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late bool isEditing;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task?.title ?? '');
    _descriptionController = TextEditingController(
      text: widget.task?.description ?? '',
    );
    isEditing = widget.task != null;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;
    await _saveTask();
    if (mounted) {
      Navigator.pop(context);
    }
  }

  Future<void> _saveTask() async {
    final notifier = ref.read(taskListProvider.notifier);
    final title = _titleController.text.trim();
    final description = _descriptionController.text.trim();

    if (widget.task == null) {
      await notifier.addTask(title, description);
    } else {
      final updatedTask = widget.task!.copyWith(
        title: title,
        description: description,
      );
      await notifier.updateTask(updatedTask);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(isEditing ? 'Edit Task' : 'New Task')),
      body: Container(
        decoration: BoxDecoration(color: theme.colorScheme.surface),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppConstants.paddingLarge),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isEditing ? 'Update your task' : 'Create a new task',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(height: AppConstants.spacingExtraLarge),
                TaskTextField(
                  controller: _titleController,
                  label: 'Title',
                  prefixIcon: Icons.title,
                  validator: TaskValidators.title,
                ),
                const SizedBox(height: AppConstants.spacingLarge),
                TaskTextField(
                  controller: _descriptionController,
                  label: 'Description',
                  prefixIcon: Icons.description_outlined,
                  maxLines: AppConstants.descriptionMaxLines,
                  validator: TaskValidators.description,
                ),
                const SizedBox(height: AppConstants.spacingHuge),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary,
                      foregroundColor: theme.colorScheme.onPrimary,
                      elevation: AppConstants.elevationLow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          AppConstants.borderRadiusLarge,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: AppConstants.paddingMedium,
                      ),
                    ),
                    child: Text(
                      isEditing ? 'Save Changes' : 'Create Task',
                      style: const TextStyle(
                        fontSize: AppConstants.fontSizeButton,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
