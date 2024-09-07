import 'package:flutter/material.dart';
import 'package:trackizer/core/constants/theme/app_colors.dart';

class GreyButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  final double? fontSize;
  final double? verticalPadding;
  final double? exHorizontalPadding;
  final double? horizontalPadding;

  const GreyButtonWidget(
      {super.key,
      this.onPressed,
      required this.label,
      this.fontSize,
      this.verticalPadding,
      this.exHorizontalPadding,
      this.horizontalPadding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: exHorizontalPadding ?? 25.0),
      child: FilledButton(
        style: ButtonStyle(
            backgroundColor: const WidgetStatePropertyAll(AppColors.grey90),
            padding: WidgetStatePropertyAll(
              EdgeInsets.symmetric(
                  vertical: verticalPadding ?? 14.0, horizontal: horizontalPadding ?? 0.0),
            ),
            side: const WidgetStatePropertyAll(BorderSide(color: AppColors.grey60))),
        onPressed: onPressed,
        child: Text(label, style: TextStyle(fontSize: fontSize ?? 18.0, color: Colors.white)),
      ),
    );
  }
}
