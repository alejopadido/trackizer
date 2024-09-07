import 'dart:math';

import 'package:flutter/material.dart';
import 'package:trackizer/core/constants/theme/app_colors.dart';

class SemiCircleProgressWidget extends StatelessWidget {
  const SemiCircleProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        height: 300,
        child: CustomPaint(
          painter: CircularCutPainter(percentage: 0.85),
        ),
      ),
    );
  }
}

class CircularCutPainter extends CustomPainter {
  final double percentage;

  CircularCutPainter({required this.percentage});

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundPaint = Paint()
      ..color = AppColors.grey70
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0;

    // Apply a gradient to make the progress look shiny
    Rect gradientRect =
        Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2);

    Paint progressPaint = Paint()
      ..shader = const LinearGradient(colors: [
        AppColors.accentP100, // Starting color
        AppColors.accentP50, // Mid color
      ], stops: [
        0.8,
        1.0
      ]).createShader(gradientRect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.round;

    double radius = min(size.width / 2, size.height / 2);
    Offset center = Offset(size.width / 2, size.height / 2);

    // Draw the background circle
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      pi * 0.7, // Start at the top (12 o'clock)
      pi * 1.6, // Only draw half of the circle (for semi-circle)
      false,
      backgroundPaint,
    );

    // Draw the progress arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      pi * 0.7, // Start at 12 o'clock
      pi * 1.6 * percentage, // Progress based on percentage (0.7 = 70% of semi-circle)
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
