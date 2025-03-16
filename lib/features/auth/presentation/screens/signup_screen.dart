// screens/signup_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_sphere/core/widgets/app_elevated_btn_widget.dart';
import 'package:social_sphere/core/widgets/app_form_field_widget.dart';
import 'package:social_sphere/core/widgets/app_text_btn_widget.dart';
import 'package:social_sphere/features/app_bar/presentation/widgets/app_bar_widget.dart';
import 'package:social_sphere/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:social_sphere/features/auth/presentation/bloc/auth_event.dart';
import 'package:social_sphere/features/auth/presentation/bloc/auth_state.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _usernameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        showBackButton: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppFormFieldWidget(
              labelText: 'Username',
              controller: _usernameController,
            ),
            AppFormFieldWidget(
              labelText: 'Email',
              controller: _emailController,
            ),
            AppFormFieldWidget(
              labelText: 'Password',
              controller: _passwordController,
            ),
            SizedBox(height: 16.h),
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccess) {
                  Navigator.pushReplacementNamed(context, '/home',
                      arguments: {"username": state.userName});
                } else if (state is AuthFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.error)),
                  );
                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  return CircularProgressIndicator();
                }
                return AppElevatedBtnWidget(
                  onPressed: () {
                    final email = _emailController.text.trim();
                    final password = _passwordController.text.trim();
                    final username = _usernameController.text.trim();
                    context
                        .read<AuthBloc>()
                        .add(SignUpEvent(email, password, username));
                  },
                  text: 'Sign Up',
                );
              },
            ),
            SizedBox(height: 16.h),
            AppTextBtnWidget(
                text: 'Already have an account? Login',
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                })
          ],
        ),
      ),
    );
  }
}
