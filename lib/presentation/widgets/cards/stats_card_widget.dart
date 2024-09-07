import 'package:flutter/material.dart';
import 'package:trackizer/core/constants/theme/app_colors.dart';
import 'package:trackizer/core/utils/utils.dart';

class StatsCardWidget extends StatelessWidget {
  final String name;
  final Color color;
  final double value;
  final bool? isMoney;
  const StatsCardWidget({
    super.key,
    required this.name,
    required this.color,
    required this.value,
    this.isMoney = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        decoration: BoxDecoration(
          color: AppColors.grey70,
          borderRadius: BorderRadius.circular(15.0),
          border: const Border(
            left: BorderSide(color: AppColors.grey60, width: 1.3),
            // top: BorderSide(color: AppColors.grey60, width: 1.3),
            bottom: BorderSide(color: AppColors.grey60, width: .3),
          ),
        ),
        child: CustomPaint(
          painter: TopBorderPainter(color),
          child: Column(
            children: [
              Text(
                name,
                style: const TextStyle(color: AppColors.grey30),
              ),
              Text(
                '${isMoney != null && isMoney == true ? '\$' : ''} ${doubleFormatter(value)}',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ],
          ),
        ));
  }
}

class TopBorderPainter extends CustomPainter {
  final Color color;

  TopBorderPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = 1.0;

    // Position of the top border
    double startX = size.width * 0.2;
    double endX = size.width * 0.8;
    double topY = -15;

    // Draw the line
    canvas.drawLine(Offset(startX, topY), Offset(endX, topY), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
