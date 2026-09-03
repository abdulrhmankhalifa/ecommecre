import 'package:flutter/material.dart';

import '../../features/authentication/ui/screens/login/login_screen.dart';

abstract class AppRouter {
  static MaterialPageRoute get login =>
      MaterialPageRoute(builder: (context) => const LoginScreen());
}
