# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Flutter ecommerce application (appears to be a doctor appointment app based on naming conventions). It follows a feature-first architecture with clean architecture principles, using BLoC/Cubit for state management and GetIt for dependency injection.

## Build & Development Commands

### Running the app
```bash
flutter run
```

### Code Generation
The project uses code generation for models, API services, and state management. Run this after modifying any files with `@freezed`, `@JsonSerializable`, or `@RestApi` annotations:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Testing
```bash
flutter test
```

### Analysis
```bash
flutter analyze
```

### Getting dependencies
```bash
flutter pub get
```

## Architecture

### Feature Structure
Each feature follows a clean architecture with three layers:
```
features/
  feature_name/
    domain/
      repos/          # Abstract repository interfaces
    data/
      apis/           # Retrofit API service definitions (feature-specific)
      models/         # Data models with json_serializable
      repos/          # Repository implementations (XxxRepoImpl)
    presentation/ (or preesentation/)
      cubit/          # State management (Cubit + State)
      ui/
        widgets/      # Feature-specific widgets
```

**Note:** There's a typo in the login feature folder name (`preesentation` instead of `presentation`). Be mindful of this inconsistency when navigating the codebase.

**Exception:** The `onboarding` feature does not have a domain layer as it doesn't require data operations.

### Core Architecture Patterns

**Dependency Injection (GetIt):**
- All dependencies are registered in [lib/core/di/dependency_injection.dart](lib/core/di/dependency_injection.dart)
- Abstract repositories (from domain layer) are registered as interfaces, with concrete implementations (XxxRepoImpl from data layer) provided
- Repositories are registered as `LazySingleton`
- Cubits are registered as `Factory` (new instance per injection)
- API services are registered as singletons
- Pattern: `getIt.registerLazySingleton<AbstractRepo>(() => RepoImpl(getIt()));`
- When adding new features, register dependencies in `setupGetIt()`

**Routing:**
- Centralized routing in [lib/core/routing/app_router.dart](lib/core/routing/app_router.dart)
- Route names defined in [lib/core/routing/routes.dart](lib/core/routing/routes.dart)
- BlocProviders are created at the routing level
- Initial route determined by login status check

**State Management:**
- Uses `flutter_bloc` with Cubit pattern (not full Bloc)
- States are defined using `@freezed` for immutability
- Pattern: `XxxCubit` extends `Cubit<XxxState>`
- State files generate `.freezed.dart` files via build_runner

**Networking:**
- Uses Retrofit + Dio for API calls
- Base API service: [lib/core/networking/api_service.dart](lib/core/networking/api_service.dart)
- Feature-specific API services (e.g., `HomeApiService`) for feature endpoints
- Generic error handling via `ApiErrorHandler`
- Response wrapping via `ApiResult<T>` (Freezed union: Success/Failure)
- API constants stored in `ApiConstants` and feature-specific constants files

**Repository Pattern:**
- Follows clean architecture with separation between domain and data layers
- **Domain layer** (`domain/repos/`): Abstract repository interfaces defining contracts
- **Data layer** (`data/repos/`): Concrete implementations named `XxxRepoImpl` that implement domain interfaces
- Repositories wrap API calls and return `ApiResult<T>`
- Handle try-catch logic and convert exceptions to `ApiResult.failure`
- Example pattern:
  ```dart
  // domain/repos/example_repo.dart
  abstract class ExampleRepo {
    Future<ApiResult<Response>> getData();
  }

  // data/repos/example_repo_impl.dart
  class ExampleRepoImpl implements ExampleRepo {
    final ApiService _apiService;
    ExampleRepoImpl(this._apiService);

    @override
    Future<ApiResult<Response>> getData() async {
      try {
        final response = await _apiService.getData();
        return ApiResult.success(response);
      } catch (error) {
        return ApiResult.failure(ErrorHandler.handle(error));
      }
    }
  }
  ```

**Data Models:**
- Use `json_serializable` for JSON parsing
- Generate `.g.dart` files via build_runner
- Separate request/response models

**Widget Composition (IMPORTANT):**
- **ALWAYS break down screens into smaller, reusable widgets**
- Each screen should be composed of multiple focused widgets stored in a `widgets/` folder
- Main screen files should primarily handle layout and composition, not contain large build methods
- Widget breakdown guidelines:
  - Separate visual sections (background, header, content cards, buttons, etc.)
  - Extract repeated UI patterns into reusable widgets
  - Keep widgets focused on a single responsibility
  - Use private widgets (`_WidgetName`) only when the widget is truly screen-specific and won't be reused
- Example structure:
  ```
  features/feature_name/
    presentation/ui/
      feature_screen.dart        # Main screen (composition only)
      widgets/
        feature_header.dart      # Header section
        feature_content.dart     # Content section
        feature_button.dart      # Custom button
  ```
- **Reference:** See [lib/features/onboarding/](lib/features/onboarding/) for a good example of proper widget composition:
  - `onboarding_screen.dart` - main screen (only composition)
  - `widgets/onboarding_background.dart` - gradient background
  - `widgets/onboarding_person_image.dart` - image with error handling
  - `widgets/onboarding_content_card.dart` - white container
  - `widgets/onboarding_title_and_description.dart` - text section
  - `widgets/gender_selection_buttons.dart` - button group

### Authentication Flow
- Login status checked on app start via `SharedPrefHelper` (secure storage)
- Token stored in secure storage with key `SharedPrefKeys.userToken`
- Initial route: logged in → HomeScreen, not logged in → LoginScreen
- Check performed in [lib/main.dart](lib/main.dart) `checkIfLoggedInUser()`

### Core Utilities Location
- **Helpers:** [lib/core/helpers/](lib/core/helpers/) (extensions, regex, constants, spacing, SharedPreferences)
- **Networking:** [lib/core/networking/](lib/core/networking/) (Dio factory, API services, error handling)
- **Theming:** [lib/core/theming/](lib/core/theming/) (colors, styles, font weights)
- **Widgets:** [lib/core/widgets/](lib/core/widgets/) (reusable components like buttons, text fields)

## Key Dependencies

- `flutter_bloc` - State management (Cubit pattern)
- `get_it` - Dependency injection
- `dio` + `retrofit` - HTTP client and type-safe API generation
- `freezed` - Immutable state classes and unions
- `json_serializable` - JSON serialization
- `flutter_screenutil` - Responsive UI (design size: 375x812)
- `shared_preferences` + `flutter_secure_storage` - Local storage
- `shimmer` - Loading states
- `cached_network_image` - Image caching

## Important Notes

- Always run `flutter pub run build_runner build --delete-conflicting-outputs` after modifying generated code files
- The project has duplicate cubit files in some features (both `/cubit/` and `/logic/` folders) - check which is being imported
- Login feature has typo: folder named `preesentation` instead of `presentation`
- Design size for ScreenUtil: 375x812 (configured in [lib/ecommerce_app.dart](lib/ecommerce_app.dart))
- App title is "Doc App" despite being ecommerce_assignment3
