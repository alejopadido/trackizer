import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trackizer/core/constants/theme/app_colors.dart';

class BillCardWidget extends StatelessWidget {
  final DateTime date;
  final String name;
  final String price;

  const BillCardWidget({super.key, required this.date, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    final day = date.day.toString();
    final shortMonth = DateFormat('MMM').format(date);

    const dateTextStyle = TextStyle(fontSize: 16.0, color: AppColors.grey30);

    return Column(
      children: [
        const SizedBox(height: 15.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: ListTile(
            leading: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: AppColors.grey70,
              ),
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(shortMonth, style: dateTextStyle),
                  Text(day, style: dateTextStyle),
                ],
              ),
            ),
            title: Text(name, style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            trailing: Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Text(
                '\$$price',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              side: const BorderSide(color: AppColors.grey60),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          ),
        ),
      ],
    );
  }
}
