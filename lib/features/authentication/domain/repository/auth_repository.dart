import 'package:ecommerce/features/network/api_result.dart';
import 'package:ecommerce/features/network/models/request/login_request.dart';

abstract class AuthRepository {
  Future<ApiResult<void>> login(LoginRequest request);
}
