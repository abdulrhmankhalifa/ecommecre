import 'package:ecommerce/features/network/api_result.dart';
import 'package:injectable/injectable.dart';

import '../../../network/models/request/login_request.dart';
import '../repository/auth_repository.dart';

@injectable
class LoginUseCase {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  Future<ApiResult<void>> call(LoginRequest request) =>
      _authRepository.login(request);
}
