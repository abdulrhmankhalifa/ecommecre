import 'package:dio/dio.dart';
import 'package:ecommerce/features/network/models/request/login_request.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../models/response/auth_response.dart';

part 'api_services.g.dart';

@RestApi()
@injectable
abstract class ApiServices {
  @factoryMethod
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;

  @POST('auth/signin')
  Future<AuthResponse> login(@Body() LoginRequest request);
}
