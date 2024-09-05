import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trackizer/core/constants/app_router.dart';
import 'package:trackizer/core/constants/theme/app_colors.dart';
import 'package:trackizer/presentation/widgets/widgets.dart';

class ChooseRegistrationScreen extends StatelessWidget {
  const ChooseRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset('assets/icons/logo.svg'),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const HighlightedButtonWidget(
                    icon: 'assets/icons/Apple.svg',
                    label: 'Sign up with Apple',
                    color: Colors.black,
                  ),
                  const SizedBox(height: 20.0),
                  const HighlightedButtonWidget(
                    icon: 'assets/icons/Google.svg',
                    label: 'Sign up with Google',
                    color: Colors.white,
                  ),
                  const SizedBox(height: 20.0),
                  const HighlightedButtonWidget(
                    icon: 'assets/icons/Facebook.svg',
                    label: 'Sign up with Facebook',
                    color: Color(0xFF147BEB),
                  ),
                  const SizedBox(height: 20.0),
                  const Text('or', textAlign: TextAlign.center),
                  const SizedBox(height: 20.0),
                  GreyButtonWidget(
                    label: 'Sign up with E-mail',
                    onPressed: () {
                      appRouter.push('/emailRegister');
                    },
                  ),
                  const SizedBox(height: 25.0),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Text(
                      'By registering, you agree to our Terms of Use. Learn how we collect, use and share your data.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14.0, color: AppColors.grey50),
                    ),
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
