import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trackizer/core/constants/app_router.dart';
import 'package:trackizer/core/utils/utils.dart';
import 'package:trackizer/presentation/widgets/widgets.dart';

import '../../../../core/constants/theme/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool onRemember = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset('assets/icons/logo.svg'),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFieldWidget(
                      controller: _emailController,
                      label: 'E-mail address',
                      hint: '',
                      validator: emailValidator),
                  const SizedBox(height: 25.0),
                  TextFieldWidget(
                    controller: _passwordController,
                    label: 'Password',
                    hint: '',
                    validator: passwordValidator,
                    obscure: true,
                  ),
                  const SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            side: const BorderSide(color: AppColors.grey60),
                            activeColor: AppColors.accentS50,
                            value: onRemember,
                            onChanged: (value) {
                              setState(() {
                                onRemember = !onRemember;
                              });
                            },
                          ),
                          const Text('Remember me', style: TextStyle(color: AppColors.grey50)),
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot password?',
                          style: TextStyle(
                            color: AppColors.grey50,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.grey50,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  HighlightedButtonWidget(
                    label: 'Sign In',
                    color: AppColors.accentP100,
                    onPressed: () {
                      appRouter.go('/');
                    },
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('You don\'t have an account yet?', textAlign: TextAlign.center),
                  const SizedBox(height: 15.0),
                  GreyButtonWidget(
                    label: 'Sign Up',
                    onPressed: () {
                      appRouter.go('/chooseRegistration');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
