import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../common/utils/resource.dart';
import '../../../../../network/models/request/register_request.dart';
import '../../../../domain/usecases/register_usecase.dart';
import 'register_state.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase _registerUseCase;

  RegisterCubit(this._registerUseCase)
      : super(RegisterState(registerResource: Resource.initial()));

  register({
    required String name,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  }) async {
    emit(RegisterState(registerResource: Resource.loading()));
    var apiResult = await _registerUseCase.call(
      RegisterRequest(
        name: name,
        email: email,
        password: password,
        rePassword: rePassword,
        phone: phone,
      ),
    );
    if (apiResult.isSuccess) {
      emit(RegisterState(registerResource: Resource.success()));
    } else {
      emit(
        RegisterState(
          registerResource: Resource.error(errorMessage: apiResult.errorMessage),
        ),
      );
    }
  }
}
