import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trackizer/core/constants/theme/app_colors.dart';

class SubscriptionCardWidget extends StatelessWidget {
  final String logo;
  final String name;
  final String price;

  const SubscriptionCardWidget(
      {super.key, required this.logo, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: ListTile(
            leading: SvgPicture.asset(logo),
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
