import 'package:ecommerce/features/authentication/ui/screens/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';

import '../../../../../core/app_assets.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../common/widgets/app_button.dart';
import '../../../../common/widgets/app_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _userNameEditingController =
        TextEditingController();
    final TextEditingController _passwordEditingController =
        TextEditingController();
    bool isPasswordVisible = true;
    LoginCubit loginCubit = getIt();
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),

              // Route Logo
              Center(child: Image.asset(AppAssets.logo)),
              const SizedBox(height: 60),

              // Title and Subtitle
              Text(
                'Welcome Back To Route',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Please sign in with your mail',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w300,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 40),

              // User Name Field
              AppTextField(
                title: 'User Name',
                hintText: 'enter your name',
                controller: _userNameEditingController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 28),

              // Password Field
              AppTextField(
                title: 'Password',
                hintText: 'enter your password',
                controller: _passwordEditingController,
                obscureText: true,
                suffixIcon: const Icon(
                  Icons.visibility_off_outlined,
                  color: AppColors.grey,
                ),
              ),
              const SizedBox(height: 16),

              // Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Forgot password',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 56),

              // Login Button
              AppButton(title: 'Login', isLoading: false, onPressed: () {}),
              const SizedBox(height: 32),

              // Register Prompt
              Center(
                child: GestureDetector(
                  onTap: () {},
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.white,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(text: "Don’t have an account? "),
                        TextSpan(
                          text: "Create Account",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
