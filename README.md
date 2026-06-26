# Gestor de Tareas Personal

Una aplicación Flutter diseñada para gestionar tareas diarias. Construida con los principios de Arquitectura Limpia (Clean Architecture).

## Características

- **Gestión de Tareas**: Crea, visualiza, actualiza y elimina tareas.
- **Almacenamiento Persistente**: Las tareas se guardan localmente utilizando Hive, garantizando que los datos persistan entre sesiones.
- **Arquitectura Limpia**: Separación clara de responsabilidades en capas de Datos, Dominio y Presentación.
- **Gestión de Estado Moderna**: Implementación robusta con Riverpod para un flujo de datos unidireccional y reactivo.
- **Seguridad de Tipos e Inmutabilidad**: Uso de Freezed para modelos de datos y estados seguros.

## Estructura del Proyecto

```
lib/
 ├── main.dart                          # Punto de entrada de la aplicación
 ├── core/                              # Componentes compartidos y configuraciones
 │    ├── constants/                    # Constantes globales de la app
 │    ├── database/                     # Configuración y proveedores de Hive
 │    ├── error/                        # Manejo de excepciones y fallos
 │    └── validators/                   # Validadores de formularios
 └── features/                          # Organización basada en características (Feature-first)
      └── tasks/                        # Módulo de gestión de tareas
           ├── data/                    # Capa de Datos
           │    ├── data_sources/       # Fuentes de datos (locales/remotas)
           │    ├── mappers/            # Conversión entre Modelos y Entidades
           │    ├── models/             # Modelos de datos para persistencia (Hive)
           │    ├── providers/          # Proveedores de Riverpod para la capa de datos
           │    └── repositories/       # Implementación de los repositorios
           ├── domain/                  # Capa de Dominio (Reglas de Negocio)
           │    ├── entities/           # Entidades de negocio puras
           │    ├── facades/            # Fachadas para simplificar acceso a casos de uso
           │    ├── providers/          # Proveedores de Riverpod para el dominio
           │    ├── repositories/       # Interfaces de los repositorios
           │    └── use_cases/          # Lógica de negocio específica
           └── presentation/            # Capa de Presentación (UI)
                ├── providers/          # Controladores de estado (Notifiers)
                └── screens/            # Widgets y pantallas
                     ├── task_detail/   # Pantalla de detalle de tarea
                     ├── task_form/     # Pantalla de creación/edición
                     └── task_list/     # Pantalla principal de lista
```

## Dependencias Principales

| Librería | Versión | Propósito |
| :--- | :--- | :--- |
| **flutter_riverpod** | ^3.3.2 | Gestión de estado reactiva y segura. |
| **riverpod_annotation**| ^4.0.3 | Simplifica la creación de proveedores mediante generación de código. |
| **freezed_annotation** | ^3.1.0 | Generación de modelos inmutables y uniones (unions). |
| **hive** | ^2.2.3 | Base de datos NoSQL ligera y rápida para persistencia local. |
| **hive_flutter** | ^1.1.0 | Integración de Hive con el ciclo de vida de Flutter. |

## Guía de Desarrollo

Para agregar una nueva funcionalidad, sigue estos pasos:

1.  **Dominio**: 
    *   Crea la **Entidad** en `domain/entities`.
    *   Define la interfaz del **Repositorio** en `domain/repositories`.
    *   Implementa los **Casos de Uso** en `domain/use_cases`.
    *   (Opcional) Expón la funcionalidad a través de un **Facade** en `domain/facades`.
2.  **Datos**:
    *   Crea el **Modelo** de datos en `data/models` (especialmente si requiere persistencia).
    *   Implementa el **Mapper** en `data/mappers` para transformar entre Modelo y Entidad.
    *   Implementa la fuente de datos en `data_sources`.
    *   Implementa el **Repositorio** definido en el dominio.
3.  **Presentación**:
    *   Crea el **Provider** (StateNotifier o similar) en `presentation/providers` para manejar el estado de la UI.
    *   Diseña la pantalla y widgets en `screens`.
4.  **Generación de Código**:
    *   Ejecuta: `dart run build_runner build --delete-conflicting-outputs`

## Cómo ejecutar el proyecto

1. **Prerrequisitos**: Instalación del [SDK de Flutter](https://docs.flutter.dev/get-started/install).
2. **Clonar el repositorio**:
   ```bash
   git clone https://github.com/eduardc23/personal_task_manager
   cd personal_task_manager
   ```
3. **Instalar dependencias**: `flutter pub get`
4. **Generar código**: `flutter pub run build_runner build --delete-conflicting-outputs`
5. **Ejecutar**: `flutter run`

## Licencia y Autor

- **Autor**: [Eduard](https://github.com/eduardc23)
- **Licencia**: Este proyecto está bajo la Licencia MIT.
