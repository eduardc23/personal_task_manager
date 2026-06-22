import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  Future<void> _saveTask() async {
    if (!_formKey.currentState!.validate()) return;

    await _persistTask();

    if (!mounted) return;

    if (ref.read(taskListProvider).hasError) {
      _showErrorSnackBar();
      return;
    }

    Navigator.pop(context);
  }

  Future<void> _persistTask() async {
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

  void _showErrorSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('The task could not be saved. Please try again.'),
        backgroundColor: Theme.of(context).colorScheme.error,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Task' : 'New Task'),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(color: theme.colorScheme.surface),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
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
                const SizedBox(height: 24),
                TaskTextField(
                  controller: _titleController,
                  label: 'Title',
                  prefixIcon: Icons.title,
                  validator: TaskValidators.title,
                ),
                const SizedBox(height: 20),
                TaskTextField(
                  controller: _descriptionController,
                  label: 'Description',
                  prefixIcon: Icons.description_outlined,
                  maxLines: 5,
                  validator: TaskValidators.description,
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _saveTask,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary,
                      foregroundColor: theme.colorScheme.onPrimary,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      isEditing ? 'Save Changes' : 'Create Task',
                      style: const TextStyle(
                        fontSize: 18,
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
