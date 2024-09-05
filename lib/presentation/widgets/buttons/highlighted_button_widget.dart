import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trackizer/core/constants/theme/app_colors.dart';

class HighlightedButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  final Color color;
  final String? icon;

  const HighlightedButtonWidget(
      {super.key,
      this.onPressed,
      required this.label,
      required this.color,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.5),
              offset: const Offset(0, 4),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: FilledButton(
          style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(color),
              padding: const WidgetStatePropertyAll(
                  EdgeInsets.symmetric(vertical: 14.0))),
          onPressed: onPressed,
          child: icon == null
              ? Text(label,
                  style: const TextStyle(fontSize: 18.0, color: Colors.white))
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      icon!,
                    ),
                    const SizedBox(width: 15.0),
                    Text(label,
                        style: TextStyle(
                            fontSize: 18.0,
                            color: color == Colors.white
                                ? Colors.black
                                : Colors.white))
                  ],
                ),
        ),
      ),
    );
  }
}
