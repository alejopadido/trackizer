import 'package:flutter/material.dart';
import 'package:trackizer/core/constants/theme/app_colors.dart';
import 'package:trackizer/core/utils/utils.dart';

class PasswordProgressWidget extends StatefulWidget {
  final String password;
  const PasswordProgressWidget({super.key, required this.password});

  @override
  State<PasswordProgressWidget> createState() => _PasswordProgressWidgetState();
}

class _PasswordProgressWidgetState extends State<PasswordProgressWidget> {
  List<double> goodPasswordRate(String password) {
    List<double> rate = [0, 0, 0, 0];
    if (hasMinimumLength(password)) rate[0] = 1;
    if (hasUpperCase(password)) rate[1] = 1;
    if (hasLowerCase(password)) rate[2] = 1;
    if (hasDigit(password)) rate[3] = 1;
    rate.sort((a, b) => b.compareTo(a));
    return rate;
  }

  @override
  Widget build(BuildContext context) {
    final rates = goodPasswordRate(widget.password);

    return Row(
      children: [
        SingleLinearProgress(value: rates[0]),
        const SizedBox(width: 5.0),
        SingleLinearProgress(value: rates[1]),
        const SizedBox(width: 5.0),
        SingleLinearProgress(value: rates[2]),
        const SizedBox(width: 5.0),
        SingleLinearProgress(value: rates[3]),
      ],
    );
  }
}

class SingleLinearProgress extends StatelessWidget {
  final double value;
  const SingleLinearProgress({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TweenAnimationBuilder(
        tween: Tween(begin: 0.0, end: value),
        duration: const Duration(milliseconds: 300),
        builder: (context, v, child) => LinearProgressIndicator(
          value: v,
          backgroundColor: AppColors.grey70,
          color: AppColors.accentS50,
          borderRadius: BorderRadius.circular(15.0),
          minHeight: 5.0,
        ),
      ),
    );
  }
}
