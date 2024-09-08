import 'package:flutter/material.dart';
import 'package:trackizer/core/constants/theme/app_colors.dart';

class PageSelectorWidget extends StatefulWidget {
  final ValueChanged<int> onPageChanged;
  const PageSelectorWidget({super.key, required this.onPageChanged});

  @override
  State<PageSelectorWidget> createState() => _PageSelectorWidgetState();
}

class _PageSelectorWidgetState extends State<PageSelectorWidget> {
  int currentPage = 0;

  void _changePage(int page) {
    setState(() {
      currentPage = page;
    });
    widget.onPageChanged(currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: AppColors.grey100,
          borderRadius: BorderRadius.circular(35.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            PageTextButton(
              name: 'Your subscriptions',
              indx: 0,
              crr: currentPage,
              onPressed: () => _changePage(0),
            ),
            const SizedBox(width: 10.0),
            PageTextButton(
              name: 'Upcoming bills',
              indx: 1,
              crr: currentPage,
              onPressed: () => _changePage(1),
            ),
          ],
        ),
      ),
    );
  }
}

class PageTextButton extends StatelessWidget {
  final String name;
  final int indx;
  final int crr;
  final VoidCallback onPressed;

  const PageTextButton(
      {super.key,
      required this.name,
      required this.indx,
      required this.onPressed,
      required this.crr});

  @override
  Widget build(BuildContext context) {
    final bool isSel = indx == crr;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: isSel
            ? BoxDecoration(
                color: AppColors.grey70,
                borderRadius: BorderRadius.circular(25.0),
                border: Border.all(color: AppColors.grey50, width: 1.0))
            : null,
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Text(
          name,
          style: !isSel ? const TextStyle(color: AppColors.grey40) : null,
        ),
      ),
    );
  }
}
