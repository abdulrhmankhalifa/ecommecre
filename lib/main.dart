import 'package:ecommerce/core/di/di.dart';
import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'features/authentication/ui/screens/login/login_screen.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const LoginScreen(),
    );
  }
}
