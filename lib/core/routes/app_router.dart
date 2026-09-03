import 'package:flutter/material.dart';

import '../../features/authentication/ui/screens/login/login_screen.dart';
import '../../features/commerce/ui/screens/main_tabs_screen.dart';

abstract class AppRouter {
  static MaterialPageRoute get login =>
      MaterialPageRoute(builder: (context) => const LoginScreen());
  static MaterialPageRoute get mainScreen =>
      MaterialPageRoute(builder: (context) => const MainTabsScreen());
}
