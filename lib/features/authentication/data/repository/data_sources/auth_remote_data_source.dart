import 'package:ecommerce/features/network/models/request/login_request.dart';

import '../../../../network/api_result.dart';
import '../../../../network/models/response/auth_response.dart';

abstract class AuthRemoteDataSource {
  Future<ApiResult<AuthResponse>> login(LoginRequest request);
}
