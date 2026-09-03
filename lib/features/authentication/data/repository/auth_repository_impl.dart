import 'package:ecommerce/features/authentication/data/repository/data_sources/auth_remote_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../../network/api_result.dart';
import '../../../network/models/request/login_request.dart';
import '../../domain/repository/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImpl(this._authRemoteDataSource);
  @override
  Future<ApiResult<void>> login(LoginRequest request) {
    return _authRemoteDataSource.login(request);
  }
}
