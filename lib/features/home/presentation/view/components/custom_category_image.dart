import 'package:flutter/material.dart';
import 'package:tigor_store/features/home/data/model/product_model.dart';

class CustomCategoryImage extends StatelessWidget {
  const CustomCategoryImage({
    super.key, required this.model,
  });
  final ProductModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16),
      height: 200,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(model.image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}