---
name: create-feature
description: >-
  Standardized procedure for creating a new feature in this e-commerce project following Clean Architecture.
  Use this skill whenever asked to add, scaffold, or implement a new feature, screen, or endpoint in the app.
---

# Create Feature Skill Guide

This skill provides step-by-step instructions for implementing a new feature in accordance with the project's **Clean Architecture**, **Bloc/Cubit** state management, **Injectable/GetIt** dependency injection, and **Retrofit/Dio** networking layer (as documented in [`APP_ARCHITECTURE.md`](file:///d:/Flutter%20projects/course/ecommerce/APP_ARCHITECTURE.md)).

---

## 📁 Feature Directory Structure

For any new feature `<feature_name>` (e.g., `cart`, `products`, `orders`), create the following layout under `lib/features/<feature_name>/`:

```text
lib/features/<feature_name>/
├── data/
│   ├── mappers/                    # DTO <-> Entity Mappers
│   └── repository/
│       ├── data_sources/           # <Feature>RemoteDataSource & <Feature>RemoteDataSourceImpl
│       └── <feature>_repository_impl.dart
│
├── domain/
│   ├── entity/                     # Core Domain Entities
│   ├── repository/                 # <Feature>Repository Interface
│   └── usecases/                   # UseCase classes (@injectable)
│
└── ui/
    ├── screens/
    │   └── <screen_name>/         # Screen widget + Cubit & State
    └── widgets/                    # Feature-specific widgets
```

---

## 🛠️ Step-by-Step Implementation Workflow

### Step 1: Network Models & API Endpoints

1. **Define DTOs**:
   - Request DTOs in `lib/features/network/models/request/<feature>_<action>_request.dart`
   - Response DTOs in `lib/features/network/models/response/<feature>_<action>_response.dart`
   - Annotate with `@JsonSerializable()`.

2. **Define Retrofit Endpoints**:
   - Add endpoint methods to `lib/features/network/api/api_services.dart` using `@POST`, `@GET`, `@PUT`, `@DELETE`.

---

### Step 2: Domain Layer

1. **Entities**:
   - Create core entity classes in `lib/features/<feature_name>/domain/entity/`.
   - Keep entities free of network/json annotation dependencies.

2. **Repository Interface**:
   - Create abstract class `<Feature>Repository` in `lib/features/<feature_name>/domain/repository/<feature>_repository.dart`.
   - Define methods returning `Future<ApiResult<Entity>>` or `Future<ApiResult<List<Entity>>>`.

3. **UseCases**:
   - Create single-responsibility UseCases in `lib/features/<feature_name>/domain/usecases/`.
   - Annotate with `@injectable`.
   - Inject repository via constructor.

```dart
@injectable
class GetProductsUseCase {
  final ProductsRepository _repository;
  GetProductsUseCase(this._repository);

  Future<ApiResult<List<ProductEntity>>> call() {
    return _repository.getProducts();
  }
}
```

---

### Step 3: Data Layer

1. **Remote Data Source**:
   - Interface: `abstract class <Feature>RemoteDataSource` in `lib/features/<feature_name>/data/repository/data_sources/`.
   - Implementation: `@Injectable(as: <Feature>RemoteDataSource)` class `RemoteDataSourceImpl` calling `ApiServices`.

2. **Data Mappers**:
   - Create mapper classes in `lib/features/<feature_name>/data/mappers/<entity>_mapper.dart`.
   - Annotate mapper classes with `@injectable`.
   - Each mapper class should contain two instance methods:
     1. `toEntity(DataModel? model)`: Maps a single Response DTO to a Domain Entity (converting nullable DTO fields to non-nullable Entity fields with fallback defaults).
     2. `toEntityList(List<DataModel>? models)`: Maps a list of Response DTOs to a list of Domain Entities using `toEntity`.

   ```dart
   @injectable
   class ProductMapper {
     Product toEntity(ProductDm? productDm) {
       return Product(
         id: productDm?.id ?? '',
         title: productDm?.title ?? '',
         price: productDm?.price ?? 0,
         // ... map all fields with non-nullable fallbacks
       );
     }

     List<Product> toEntityList(List<ProductDm>? products) {
       return products?.map((e) => toEntity(e)).toList() ?? [];
     }
   }
   ```

3. **Repository Implementation**:
   - Class `@Injectable(as: <Feature>Repository)` in `lib/features/<feature_name>/data/repository/<feature>_repository_impl.dart`.
   - Call data source methods and map results using mappers.

---

### Step 4: UI & State Management Layer

1. **Cubit & State**:
   - Located in `lib/features/<feature_name>/ui/screens/<screen_name>/`.
   - State uses `Resource<T>` from `lib/features/common/utils/resource.dart`.
   - Cubit injects UseCase(s) via `@injectable`.

2. **UI Screen & Widgets**:
   - Build UI consuming state via `BlocConsumer` or `BlocBuilder`.
   - Handle `Status.loading`, `Status.success`, `Status.error`.

---

### Step 5: Code Generation & Dependency Injection

Whenever annotations (`@injectable`, `@RestApi`, `@JsonSerializable`) are added or modified, run:

```bash
dart run build_runner build --delete-conflicting-outputs
```

---

## 🔍 Verification Checklist

1. Run `dart analyze` to verify clean compilation and no lint errors.
2. Ensure all UseCases, Repositories, Data Sources, and Cubits are properly annotated for Dependency Injection.
3. Confirm new routes are declared in `AppRouter` (`lib/core/routes/`).
