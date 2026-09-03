import 'package:ecommerce/features/authentication/data/repository/data_sources/auth_remote_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/shared_pref_utils/shared_pref_utils.dart';
import '../../../network/api_result.dart';
import '../../../network/models/request/login_request.dart';
import '../../../network/models/request/register_request.dart';
import '../../domain/repository/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  final SharedPrefUtils _sharedPreferences;

  AuthRepositoryImpl(this._authRemoteDataSource, this._sharedPreferences);
  @override
  Future<ApiResult<void>> login(LoginRequest request) async {
    var result = await _authRemoteDataSource.login(request);
    if (result.isSuccess && result.getData()?.token != null) {
      _sharedPreferences.saveToken(result.getData()!.token!);
    }
    return result;
  }

  @override
  Future<ApiResult<void>> register(RegisterRequest request) async {
    var result = await _authRemoteDataSource.register(request);
    if (result.isSuccess && result.getData()?.token != null) {
      _sharedPreferences.saveToken(result.getData()!.token!);
    }
    return result;
  }
}
