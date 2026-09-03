import 'package:ecommerce/core/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/app_assets.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../common/utils/resource.dart';
import '../../../../common/widgets/app_button.dart';
import '../../../../common/widgets/app_text_field.dart';
import 'cubit/register_cubit.dart';
import 'cubit/register_state.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final RegisterCubit _registerCubit = getIt<RegisterCubit>();

  @override
  void dispose() {
    _fullNameController.dispose();
    _mobileNumberController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onSignUpPressed() {
    final name = _fullNameController.text.trim();
    final mobile = _mobileNumberController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    if (name.isEmpty || mobile.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    _registerCubit.register(
      name: name,
      email: email,
      password: password,
      rePassword: password,
      phone: mobile,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterCubit>.value(
      value: _registerCubit,
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 24.0,
            ),
            child: BlocConsumer<RegisterCubit, RegisterState>(
              listener: (context, state) {
                if (state.registerResource.status == Status.success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Account created successfully!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                  Navigator.pushReplacement(context, AppRouter.mainScreen);
                } else if (state.registerResource.status == Status.error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        state.registerResource.errorMessage.isNotEmpty
                            ? state.registerResource.errorMessage
                            : 'Failed to create account',
                      ),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              builder: (context, state) {
                final isLoading =
                    state.registerResource.status == Status.loading;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    // Route Logo
                    Center(child: Image.asset(AppAssets.logo)),
                    const SizedBox(height: 40),

                    // Full Name Field
                    AppTextField(
                      title: 'Full Name',
                      hintText: 'enter your full name',
                      controller: _fullNameController,
                    ),
                    const SizedBox(height: 20),

                    // Mobile Number Field
                    AppTextField(
                      title: 'Mobile Number',
                      hintText: 'enter your mobile no.',
                      controller: _mobileNumberController,
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 20),

                    // E-mail address Field
                    AppTextField(
                      title: 'E-mail address',
                      hintText: 'enter your email address',
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20),

                    // Password Field
                    AppTextField(
                      title: 'Password',
                      hintText: 'enter your password',
                      controller: _passwordController,
                      obscureText: true,
                      suffixIcon: const Icon(
                        Icons.visibility_off_outlined,
                        color: AppColors.grey,
                      ),
                    ),
                    const SizedBox(height: 40),

                    // Sign Up Button
                    AppButton(
                      title: 'Sign up',
                      isLoading: isLoading,
                      onPressed: _onSignUpPressed,
                    ),
                    const SizedBox(height: 24),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
