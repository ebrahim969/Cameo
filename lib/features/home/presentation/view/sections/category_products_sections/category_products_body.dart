import 'package:flutter/material.dart';
import 'package:tigor_store/features/admin/data/models/category_model.dart';
import 'package:tigor_store/features/home/presentation/view/components/category_products_components/custom_category_products_app_bar.dart';
import 'package:tigor_store/features/home/presentation/view/sections/category_products_sections/custom_category_products_section.dart';

class CategoryProductsBody extends StatelessWidget {
  const CategoryProductsBody({
    super.key, required this.model,
  });
  final CategoryModel model;
  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 24,
          ),
        ),
        SliverToBoxAdapter(
          child: CustomCategoryProductsAppBar(model: model)
        ),
        const SliverToBoxAdapter(
          child: CustomCategoryProductsSection(),
        )
      ],
    );
  }
}

