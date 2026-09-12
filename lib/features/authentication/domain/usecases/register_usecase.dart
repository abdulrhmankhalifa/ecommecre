import 'package:ecommerce/features/network/api_result.dart';
import 'package:injectable/injectable.dart';

import '../../../network/models/request/register_request.dart';
import '../repository/auth_repository.dart';

@injectable
class RegisterUseCase {
  final AuthRepository _authRepository;

  RegisterUseCase(this._authRepository);

  Future<ApiResult<void>> call(RegisterRequest request) =>
      _authRepository.register(request);
}
