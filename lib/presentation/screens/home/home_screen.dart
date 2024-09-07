import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trackizer/core/constants/theme/app_colors.dart';
import 'package:trackizer/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 25.0, top: 10.0),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.grey80, AppColors.grey70],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 25.0, top: 10.0),
                    child: GestureDetector(
                      child: SvgPicture.asset(
                        'assets/icons/Settings.svg',
                        color: AppColors.grey20,
                        alignment: Alignment.centerRight,
                      ),
                    ),
                  ),
                  _circularProgressAndSpending(),
                  const SizedBox(height: 15.0),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      StatsCardWidget(
                        color: AppColors.accentP50,
                        name: 'Active subs',
                        value: 12,
                      ),
                      StatsCardWidget(
                        color: AppColors.primary10,
                        name: 'Highest subs',
                        value: 19.99,
                        isMoney: true,
                      ),
                      StatsCardWidget(
                        color: AppColors.accentS50,
                        name: 'Lowest subs',
                        value: 5.99,
                        isMoney: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _circularProgressAndSpending() {
  return Stack(
    alignment: Alignment.center,
    children: [
      const SemiCircleProgressWidget(),
      Column(
        children: [
          SvgPicture.asset(
            'assets/icons/logo.svg',
            width: 120.0,
          ),
          const SizedBox(height: 15.0),
          const Text(
            '\$1,235',
            style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
          ),
          const Text(
            'This month bills',
            style: TextStyle(fontSize: 14.0, color: AppColors.grey40),
          ),
          const SizedBox(height: 25.0),
          const GreyButtonWidget(
            label: 'See your budget',
            horizontalPadding: 15.0,
            verticalPadding: 0.0,
            fontSize: 14.0,
          ),
        ],
      ),
    ],
  );
}
