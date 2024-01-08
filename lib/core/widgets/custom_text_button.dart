import 'package:flutter/material.dart';
import 'package:tigor_store/core/utils/app_colors.dart';
import 'package:tigor_store/core/utils/app_styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.txt, this.onPressed,
  });

  final String txt;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.all(8),
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.bacgroudColor,
        borderRadius: BorderRadius.circular(16)
      ),
      child: TextButton(
          onPressed: onPressed,
          child: Text(
            txt,
            style: Styles.anybody400style24.copyWith(
                fontSize: 16, color: AppColors.primaryColor),
          )),
    );
  }
}
