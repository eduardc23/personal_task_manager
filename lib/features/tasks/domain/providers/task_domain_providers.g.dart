// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_domain_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getTasksUseCase)
final getTasksUseCaseProvider = GetTasksUseCaseProvider._();

final class GetTasksUseCaseProvider
    extends
        $FunctionalProvider<GetTasksUseCase, GetTasksUseCase, GetTasksUseCase>
    with $Provider<GetTasksUseCase> {
  GetTasksUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getTasksUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getTasksUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetTasksUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetTasksUseCase create(Ref ref) {
    return getTasksUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetTasksUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetTasksUseCase>(value),
    );
  }
}

String _$getTasksUseCaseHash() => r'672f8d9f0578b8e95fab4697da871d08566e5f21';

@ProviderFor(addTaskUseCase)
final addTaskUseCaseProvider = AddTaskUseCaseProvider._();

final class AddTaskUseCaseProvider
    extends $FunctionalProvider<AddTaskUseCase, AddTaskUseCase, AddTaskUseCase>
    with $Provider<AddTaskUseCase> {
  AddTaskUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addTaskUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addTaskUseCaseHash();

  @$internal
  @override
  $ProviderElement<AddTaskUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AddTaskUseCase create(Ref ref) {
    return addTaskUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AddTaskUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AddTaskUseCase>(value),
    );
  }
}

String _$addTaskUseCaseHash() => r'49fd9543f114d375dbf18ef3b5255c7fac419474';

@ProviderFor(updateTaskUseCase)
final updateTaskUseCaseProvider = UpdateTaskUseCaseProvider._();

final class UpdateTaskUseCaseProvider
    extends
        $FunctionalProvider<
          UpdateTaskUseCase,
          UpdateTaskUseCase,
          UpdateTaskUseCase
        >
    with $Provider<UpdateTaskUseCase> {
  UpdateTaskUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateTaskUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateTaskUseCaseHash();

  @$internal
  @override
  $ProviderElement<UpdateTaskUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UpdateTaskUseCase create(Ref ref) {
    return updateTaskUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UpdateTaskUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UpdateTaskUseCase>(value),
    );
  }
}

String _$updateTaskUseCaseHash() => r'98ed380f1d812765f65912d1b56d50b9dfb5b819';

@ProviderFor(deleteTaskUseCase)
final deleteTaskUseCaseProvider = DeleteTaskUseCaseProvider._();

final class DeleteTaskUseCaseProvider
    extends
        $FunctionalProvider<
          DeleteTaskUseCase,
          DeleteTaskUseCase,
          DeleteTaskUseCase
        >
    with $Provider<DeleteTaskUseCase> {
  DeleteTaskUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deleteTaskUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deleteTaskUseCaseHash();

  @$internal
  @override
  $ProviderElement<DeleteTaskUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DeleteTaskUseCase create(Ref ref) {
    return deleteTaskUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeleteTaskUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeleteTaskUseCase>(value),
    );
  }
}

String _$deleteTaskUseCaseHash() => r'4da09c70fd2bf3ee0b3f5a3ae2da6e175051149f';
