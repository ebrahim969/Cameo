import 'package:flutter/material.dart';
import 'package:tigor_store/core/utils/app_colors.dart';
import 'package:tigor_store/core/utils/app_styles.dart';
import 'package:tigor_store/features/admin/data/models/category_model.dart';

class CustomCategoryProductsAppBar extends StatelessWidget {
  const CustomCategoryProductsAppBar({
    super.key,
    required this.model,
  });

  final CategoryModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      height: 60,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.blakColor,
        borderRadius: BorderRadius.all(Radius.circular(16))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.bacgroudColor,
            backgroundImage: NetworkImage(model.image),
          ),
          const SizedBox(width: 20,),
          Text("${model.title}"" Products", style: Styles.anybody400style16,)
        ],
      ),
    );
  }
}




