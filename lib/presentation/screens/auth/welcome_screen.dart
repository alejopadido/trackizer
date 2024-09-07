import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trackizer/core/constants/app_router.dart';
import 'package:trackizer/presentation/widgets/widgets.dart';

import '../../../core/constants/theme/app_colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 50.0),
            SvgPicture.asset('assets/icons/logo.svg'),
            const SizedBox(height: 20.0),
            Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset('assets/img/welcome-frame.svg'),
                Positioned(
                  left: 0,
                  top: 0,
                  child: Image.asset('assets/img/bubbles.png'),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Image.asset('assets/img/bubbles2.png'),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Text(
                'Don\'t get charged by surprise again, keep track of your subscriptions',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40.0),
            HighlightedButtonWidget(
              label: 'Get Started',
              color: AppColors.accentP100,
              onPressed: () {
                appRouter.push('/chooseRegistration');
              },
            ),
            const SizedBox(height: 20.0),
            GreyButtonWidget(
                label: 'I have an account',
                onPressed: () {
                  appRouter.go('/login');
                })
          ],
        ),
      ),
    );
  }
}
