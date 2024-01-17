import 'package:flutter/material.dart';
import 'package:tigor_store/core/utils/app_colors.dart';
import 'package:tigor_store/core/utils/app_styles.dart';
import 'package:tigor_store/features/admin/data/models/category_model.dart';
import 'package:tigor_store/features/home/presentation/view/components/custom_network_image_widget.dart';

class CustomCategoryItem extends StatelessWidget {
  const CustomCategoryItem({super.key, required this.model});
  final CategoryModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(8),
          height: 70,
          width: 70,
          decoration: const BoxDecoration(
            shape: BoxShape.circle, ),
          child:  CustomNetworkImage(
            circle: true,
            imageUrl:
                model.imageUrl,
            height: 50,
            width: 50,
          ),
        ),
        FittedBox(
          alignment: Alignment.center,
          fit: BoxFit.scaleDown,
          child: SizedBox(
            width: 70,
            child: Text(
              model.title,
              style: Styles.anybody400style11.copyWith(color: AppColors.blakColor),
              maxLines: 2,
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}
