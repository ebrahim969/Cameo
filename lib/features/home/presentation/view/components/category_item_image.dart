import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tigor_store/core/functions/navigation.dart';
import 'package:tigor_store/core/utils/app_colors.dart';
import 'package:tigor_store/features/admin/data/models/category_model.dart';
import 'package:tigor_store/features/home/presentation/view/components/custom_network_image_widget.dart';

class CategoryItemImage extends StatelessWidget {
  const CategoryItemImage({
    super.key,
    required this.model,
  });

  final CategoryModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        customNavigate(context, '/CategoryProductsView', extra: model);
        log(model.title);
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          shape: BoxShape.circle, 
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: AppColors.primaryColor.withOpacity(0.3), offset: const Offset(0, 1.5))
          ]),
        child:  CustomNetworkImage(
          circle: true,
          imageUrl:
              model.image,
          height: 50,
          width: 50,
        ),
      ),
    );
  }
}