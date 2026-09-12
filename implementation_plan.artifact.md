# Fix Categories and Products Data Loading

The user reports that API data is fetched successfully, but categories are empty and products result in an error. This plan addresses these issues by correcting JSON parsing keys and improving type safety and error handling in the data layer.

## User Review Required

> [!IMPORTANT]
> I am assuming the API returns categories under the `data` key in the JSON response, similar to the products response. If the API uses a different key (other than `categories` or `data`), please let me know.

## Proposed Changes

### Network & Data Layer

#### [MODIFY] [home_remote_data_source_impl.dart](file:///D:/Flutter projects/course/ecommerce/lib/features/commerce/data/repository/home_repository/data_sources/remote_data_source/home_remote_data_source_impl.dart)
- Fix the `try-catch` block to correctly wrap the asynchronous API calls. Currently, the `await` call is outside the `try` block, which prevents `DioException` from being handled by the specific catch clause.

#### [MODIFY] [categories_response.dart](file:///D:/Flutter projects/course/ecommerce/lib/features/network/models/response/category/categories_response.dart)
- Change the JSON key for categories from `categories` to `data`. Standard e-commerce APIs often wrap the main result list in a `data` field.

#### [MODIFY] [product_dm.dart](file:///D:/Flutter projects/course/ecommerce/lib/features/network/models/response/product/product_dm.dart)
- Safely handle `ratingsAverage` by using `.toDouble()`. This prevents type mismatch errors if the API returns an integer for a field expected to be a double.
- Safely handle the `images` list to avoid crashes if it's null or not a list.

## Verification Plan

### Manual Verification
- Run the app and check if categories are now displayed on the home screen.
- Verify that the products section no longer shows an error and displays the products correctly.
- Check the debug console for any remaining parsing errors.
