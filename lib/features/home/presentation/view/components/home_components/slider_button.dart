import 'package:flutter/material.dart';
import 'package:tigor_store/core/utils/app_colors.dart';

class SliderButton extends StatelessWidget {
  const SliderButton({
    super.key,
    this.onPressed,
    required this.icon,
  });

  final void Function()? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 35,
        width: 35,
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: AppColors.blakColor),
        child: TextButton(
          onPressed: onPressed,
          child: Icon(
            icon,
            size: 20,
            color: AppColors.primaryColor,
          ),
        ));
  }
}
