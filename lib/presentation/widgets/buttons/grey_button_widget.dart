import 'package:flutter/material.dart';
import 'package:trackizer/core/constants/theme/app_colors.dart';

class GreyButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String label;

  const GreyButtonWidget({super.key, this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: FilledButton(
        style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(AppColors.grey90),
            padding: WidgetStatePropertyAll(
              EdgeInsets.symmetric(vertical: 14.0),
            ),
            side: WidgetStatePropertyAll(BorderSide(color: AppColors.grey60))),
        onPressed: onPressed,
        child: Text(label,
            style: const TextStyle(fontSize: 18.0, color: Colors.white)),
      ),
    );
  }
}
