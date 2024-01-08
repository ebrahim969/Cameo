import 'package:flutter/material.dart';
import 'package:tigor_store/core/utils/app_styles.dart';
import 'package:tigor_store/features/home/data/model/product_model.dart';
import 'package:tigor_store/features/home/presentation/view/components/custom_category_image.dart';
import 'package:tigor_store/features/home/presentation/view/components/custom_favorite_button.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({super.key, required this.model});
  
  final ProductModel model;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomRight,
          children: [
            CustomCategoryImage(model: model,),
            const Positioned(
              bottom: -10,
              right: -10,
              child: CustomfavoriteButton(),
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Text(model.title, style: Styles.anybody600style16,),
        Text("${model.price.toString()} \$", style: Styles.anybody400style48.copyWith(fontSize: 16)),
      ],
    );
  }
}
