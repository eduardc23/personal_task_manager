# Gestor de Tareas Personal

Una aplicación Flutter diseñada para gestionar tareas diarias. Construida con los principios de Arquitectura Limpia (Clean Architecture).

## Características

- **Gestión de Tareas**: Crea, visualiza, actualiza y elimina tareas.
- **Almacenamiento Persistente**: Tus tareas se guardan localmente utilizando la base de datos Drift, por lo que persisten incluso después de cerrar la aplicación.
- **Arquitectura Limpia**: Organizada en capas de datos, dominio y presentación para una mejor mantenibilidad y capacidad de prueba.
- **Gestión de Estado Moderna**: Utiliza Riverpod para una gestión de estado eficiente y reactiva.
- **Seguridad de Tipos**: Aprovecha Freezed para modelos de datos inmutables y generación de código con seguridad de tipos.

## Estructura del Proyecto

```
lib/
 ├── main.dart                          # Punto de entrada de la aplicación
 ├── core/                              # Componentes compartidos y configuraciones
 │    ├── database/                     # Configuración y conexión de la base de datos Drift
 │    └── validators/                   # Validadores de formularios comunes
 └── features/                          # Organización basada en características
      └── tasks/                        # Módulo principal para la gestión de tareas
           ├── data/                    # Implementación de repositorios y fuentes de datos
           ├── domain/                  # Lógica de negocio, entidades y casos de uso
           │    ├── entities/           # Entidad de tarea definida con Freezed
           │    └── use_cases/          # Casos de uso relacionados con tareas (Crear, Leer, Actualizar, Eliminar)
           └── presentation/            # Capa de UI con proveedores de Riverpod y pantallas
                ├── providers/          # Lógica de gestión de estado
                └── screens/            # Pantallas principales de la aplicación (Lista de Tareas y Formulario de Tarea)
```

## Cómo ejecutar el proyecto

Para que este proyecto funcione localmente, sigue estos pasos:

1. **Prerrequisitos**: Asegúrate de tener instalado el [SDK de Flutter](https://docs.flutter.dev/get-started/install).
2. **Clonar el repositorio**:
   ```bash
   git clone https://github.com/eduardc23/personal_task_manager
   cd personal_task_manager
   ```
3. **Instalar dependencias**:
   ```bash
   flutter pub get
   ```
4. **Generar código**: Este proyecto utiliza `build_runner` para generar código (Drift, Riverpod, Freezed). Ejecuta el siguiente comando:
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```
5. **Ejecutar la aplicación**:
   ```bash
   flutter run
   ```
