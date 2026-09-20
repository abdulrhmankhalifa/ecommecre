import 'package:ecommerce/core/di/di.dart';
import 'package:ecommerce/features/cart/ui/cubit/cart_cubit.dart';
import 'package:ecommerce/features/commerce/ui/screens/main_tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/shared_pref_utils/shared_pref_utils.dart';
import 'core/theme/app_theme.dart';
import 'features/authentication/ui/screens/login/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  SharedPrefUtils prefUtils = getIt();
  String? token = await prefUtils.getToken();

  runApp(
    BlocProvider(
      create: (context) => getIt<CartCubit>(),
      child: MyApp(isLoggedIn: token?.isNotEmpty ?? false),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: isLoggedIn ? const MainTabsScreen() : const LoginScreen(),
    );
  }
}
