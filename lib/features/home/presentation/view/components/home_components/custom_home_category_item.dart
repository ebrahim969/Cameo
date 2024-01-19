import 'package:flutter/material.dart';
import 'package:tigor_store/core/utils/app_styles.dart';
import 'package:tigor_store/features/admin/data/models/category_model.dart';
import 'package:tigor_store/features/home/presentation/view/components/home_components/category_item_image.dart';

class CustomCategoryItem extends StatelessWidget {
  const CustomCategoryItem({super.key, required this.model});
  final CategoryModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategoryItemImage(model: model),
        Text(
          model.title,
          style: Styles.anybodyBoldstyle14,
          maxLines: 2,
          overflow: TextOverflow.visible,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}


