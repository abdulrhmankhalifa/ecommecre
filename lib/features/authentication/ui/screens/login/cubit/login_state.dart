import 'package:ecommerce/features/common/utils/resource.dart';

class LoginState {
  Resource<void> loginResource = Resource.initial();

  LoginState({required this.loginResource});
}
