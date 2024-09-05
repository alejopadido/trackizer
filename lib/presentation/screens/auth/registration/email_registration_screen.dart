import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trackizer/core/constants/app_router.dart';
import 'package:trackizer/core/constants/theme/app_colors.dart';
import 'package:trackizer/core/utils/utils.dart';
import 'package:trackizer/presentation/widgets/widgets.dart';

class EmailRegistration extends StatefulWidget {
  const EmailRegistration({super.key});

  @override
  State<EmailRegistration> createState() => _EmailRegistrationState();
}

class _EmailRegistrationState extends State<EmailRegistration> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_updatePasswordProgress);
  }

  @override
  void dispose() {
    _passwordController.removeListener(_updatePasswordProgress);
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _updatePasswordProgress() {
    setState(() {}); // Trigger a rebuild when the password changes
  }

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
                  const SizedBox(height: 25.0),
                  PasswordProgressWidget(password: _passwordController.text),
                  const SizedBox(height: 15.0),
                  const Text(
                    'Use 8 or more characters with a mix of uppercase and lowercase letters, and at least 1 number.',
                    style: TextStyle(fontSize: 14.0, color: AppColors.grey50),
                  ),
                  const SizedBox(height: 40.0),
                  const HighlightedButtonWidget(
                    label: 'Get started, it\'s free!',
                    color: AppColors.accentP100,
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('Do you have already an account?',
                      textAlign: TextAlign.center),
                  const SizedBox(height: 15.0),
                  GreyButtonWidget(
                    label: 'Sign In',
                    onPressed: () {
                      appRouter.go('/login');
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
