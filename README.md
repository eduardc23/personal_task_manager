# Personal Task Manager

A Flutter application designed to help you manage your daily tasks. Built with Clean Architecture principles.

## Features

- **Task Management**: Create, view, update, and delete tasks.
- **Persistent Storage**: Your tasks are saved locally using the Drift database, so they persist even after closing the app.
- **Clean Architecture**: Organized into data, domain, and presentation layers for better maintainability and testability.
- **Modern State Management**: Uses Riverpod for efficient and reactive state management.
- **Type Safety**: Leverages Freezed for immutable data models and type-safe code generation.

## Project Structure

```
lib/
 ├── main.dart                          # Entry point of the app
 ├── core/                              # Shared components and configurations
 │    ├── database/                     # Drift database setup and connection
 │    └── validators/                   # Common form validators
 └── features/                          # Feature-based organization
      └── tasks/                        # Main module for task management
           ├── data/                    # Repositories implementation and data sources
           ├── domain/                  # Business logic, entities, and use cases
           │    ├── entities/           # Task entity defined with Freezed
           │    └── use_cases/          # Task-related use cases (Create, Read, Update, Delete)
           └── presentation/            # UI layer with Riverpod providers and screens
                ├── providers/          # State management logic
                └── screens/            # Main application screens (Task List and Task Form)
```

## How to run the project

To get this project running locally, follow these steps:

1. **Prerequisites**: Make sure you have the [Flutter SDK](https://docs.flutter.dev/get-started/install) installed.
2. **Clone the repo**:
   ```bash
   git clone https://github.com/eduardc23/personal_task_manager
   cd personal_task_manager
   ```
3. **Install dependencies**:
   ```bash
   flutter pub get
   ```
4. **Generate code**: This project uses `build_runner` for generating code (Drift, Riverpod, Freezed). Run the following command:
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```
5. **Run the app**:
   ```bash
   flutter run
   ```
