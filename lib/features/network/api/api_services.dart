import 'package:dio/dio.dart';
import 'package:ecommerce/features/network/models/request/login_request.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../models/response/auth_response.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: 'https://ecommerce.routemisr.com/api/v1/')
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;

  @POST('auth/signin')
  Future<List<AuthResponse>> login(@Body() LoginRequest request);
}
