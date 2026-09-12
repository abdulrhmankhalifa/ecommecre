# Application Architecture Reference Guide

This project follows **Clean Architecture** combined with **Bloc/Cubit** for state management and **Injectable / GetIt** for Dependency Injection.

---

## 📁 Directory Structure & Layer Mapping

```
lib/
├── core/
│   ├── di/                      # Dependency Injection (GetIt & Injectable)
│   ├── routes/                  # Navigation & Routing (AppRouter)
│   └── theme/                   # Theme, Colors (AppColors, AppTheme)
│
├── features/
│   ├── authentication/
│   │   ├── data/
│   │   │   ├── mappers/         # Data mappers between Network DTOs and Entities
│   │   │   └── repository/
│   │   │       ├── data_sources/# AuthRemoteDataSource & AuthRemoteDataSourceImpl
│   │   │       └── auth_repository_impl.dart  # AuthRepository Implementation
│   │   │
│   │   ├── domain/
│   │   │   ├── entity/          # Core Domain Entities
│   │   │   ├── repository/      # AuthRepository Interface
│   │   │   └── usecases/        # LoginUseCase, RegisterUseCase (@injectable)
│   │   │
│   │   └── ui/
│   │       ├── screens/
│   │       │   ├── login/       # LoginScreen & LoginCubit / LoginState
│   │       │   └── register/    # RegisterScreen & RegisterCubit / RegisterState
│   │       └── widgets/         # Feature-specific widgets
│   │
│   ├── common/                  # Shared UI components & utilities
│   │   ├── utils/               # Resource wrapper (Resource<T>, Status enum)
│   │   └── widgets/             # AppTextField, AppButton, etc.
│   │
│   └── network/                 # Network Infrastructure (Retrofit / Dio)
│       ├── api/                 # ApiServices (@RestApi, Retrofit interfaces)
│       ├── models/
│       │   ├── request/         # Request DTOs (LoginRequest, RegisterRequest)
│       │   └── response/        # Response DTOs (AuthResponse, User)
│       ├── api_result.dart      # ApiResult<T> wrapper (SuccessApiResult, ErrorApiResult)
│       └── utils/               # Dio Error Handling (handle_dio_error.dart)
```

---

## ⚙️ Architecture Workflow (Data Flow)

1. **UI Layer (`Screen` & `Cubit`)**:
   - UI user action calls method on `Cubit` (e.g. `RegisterCubit.register()`).
   - `Cubit` emits `Resource.loading()` state.

2. **Domain Layer (`UseCase` & `Repository Interface`)**:
   - `Cubit` invokes `UseCase.call(Request)` (e.g. `RegisterUseCase`).
   - `UseCase` delegates execution to `AuthRepository` interface.

3. **Data Layer (`RepositoryImpl` & `DataSourceImpl`)**:
   - `AuthRepositoryImpl` calls `AuthRemoteDataSource.register(request)`.
   - `AuthRemoteDataSourceImpl` invokes Retrofit `@POST` method on `ApiServices`.

4. **Network Layer (`ApiServices`)**:
   - Executes HTTP request via `Dio`.
   - On success: Returns `SuccessApiResult(data: response)`.
   - On exception: Caught & handled via `handle_dio_error.dart` returning `ErrorApiResult`.

5. **State Update**:
   - Result propagates back to `Cubit`.
   - `Cubit` emits `Resource.success()` or `Resource.error(errorMessage)` state.
   - UI consumes state via `BlocConsumer` / `BlocListener`.

---

## 🛠️ Code Generation Rules

Whenever adding `@injectable`, `@RestApi`, `@POST`, `@GET`, or `@JsonSerializable`:
```bash
dart run build_runner build --delete-conflicting-outputs
```
