import 'package:flutter/material.dart';
import 'package:tigor_store/core/utils/app_colors.dart';

class CustomfavoriteButton extends StatelessWidget {
  const CustomfavoriteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(color: AppColors.greyColor),
            BoxShadow(color: AppColors.bacgroudColor)
          ]),
      child: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.favorite_border,
          color: AppColors.greyColor,
          size: 20,
        ),
      ),
    );
  }
}


