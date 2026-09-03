import 'package:dio/dio.dart';
import 'package:ecommerce/features/authentication/data/repository/data_sources/auth_remote_data_source.dart';
import 'package:ecommerce/features/network/api/api_services.dart';
import 'package:injectable/injectable.dart';

import '../../../../network/api_result.dart';
import '../../../../network/models/request/login_request.dart';
import '../../../../network/models/request/register_request.dart';
import '../../../../network/models/response/auth_response.dart';
import '../../../../network/utils/handle_dio_error.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final ApiServices _apiServices;

  AuthRemoteDataSourceImpl(this._apiServices);
  @override
  Future<ApiResult<AuthResponse>> login(LoginRequest request) async {
    try {
      var authResponse = await _apiServices.login(request);
      return SuccessApiResult(data: authResponse);
    } on DioException catch (e) {
      return handelApiError(e);
    } catch (e) {
      return ErrorApiResult(error: ServerError());
    }
  }

  @override
  Future<ApiResult<AuthResponse>> register(RegisterRequest request) async {
    try {
      var authResponse = await _apiServices.register(request);
      return SuccessApiResult(data: authResponse);
    } on DioException catch (e) {
      return handelApiError(e);
    } catch (e) {
      return ErrorApiResult(error: ServerError());
    }
  }
}
