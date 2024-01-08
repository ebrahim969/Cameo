import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:tigor_store/core/utils/app_colors.dart';


class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    required this.controller,
    this.onPressed,
  });

  final LiquidController controller;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          side: const BorderSide(color: Colors.black26),
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(20),
          foregroundColor: Colors.white),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
            color: AppColors.primaryColor, shape: BoxShape.circle),
        child: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
