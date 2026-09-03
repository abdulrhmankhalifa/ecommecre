import 'package:ecommerce/features/authentication/ui/screens/login/cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../common/utils/resource.dart';
import '../../../../../network/models/request/login_request.dart';
import '../../../../domain/usecases/login_usecase.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;

  LoginCubit(this._loginUseCase)
    : super(LoginState(loginResource: Resource.initial()));

  login(String email, String password) async {
    emit(LoginState(loginResource: Resource.loading()));
    var apiResult = await _loginUseCase.call(
      LoginRequest(email: email, password: password),
    );
    if (apiResult.isSuccess) {
      emit(LoginState(loginResource: Resource.success()));
    } else {
      emit(
        LoginState(
          loginResource: Resource.error(errorMessage: apiResult.errorMessage),
        ),
      );
    }
  }
}
