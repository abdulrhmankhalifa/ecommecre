import 'package:dio/dio.dart';
import 'package:ecommerce/features/network/models/request/login_request.dart';
import 'package:ecommerce/features/network/models/request/update_cart_qty.dart';
import 'package:ecommerce/features/network/models/response/cart/cart_response.dart';
import 'package:ecommerce/features/network/models/response/category/categories_response.dart';
import 'package:ecommerce/features/network/models/response/product/products_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../models/request/add_to_cart_request.dart';
import '../models/request/register_request.dart';
import '../models/response/auth/auth_response.dart';

part 'api_services.g.dart';

@RestApi()
@injectable
abstract class ApiServices {
  @factoryMethod
  factory ApiServices(Dio dio) = _ApiServices;

  @POST('auth/signin')
  Future<AuthResponse> login(@Body() LoginRequest request);

  @POST('auth/signup')
  Future<AuthResponse> register(@Body() RegisterRequest request);

  @GET('categories')
  Future<CategoriesResponse> getCategories();
  @GET('products')
  Future<ProductsResponse> getProducts(
    @Query("category") String? category,
    // @Query("category") String? subCategory,
  );
  @GET('categories/{categoryId}/subcategories')
  Future<CategoriesResponse> getSubCategoriesByCategories(
    @Path('categoryId') String categoryId,
  );

  @GET('cart')
  Future<CartResponse> getCart();
  @POST('cart')
  Future<void> addToCart(@Body() AddToCartRequest request);
  @PUT('cart/{productId}')
  Future<CartResponse> updateCartQty(
    @Path() String productId,
    @Body() UpdateCartQty request,
  );
  @DELETE('cart/{productId}')
  Future<CartResponse> removeItemFromCart(@Path() String productId);
}
