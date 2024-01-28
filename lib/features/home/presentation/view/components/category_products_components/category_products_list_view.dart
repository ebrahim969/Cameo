import 'package:flutter/material.dart';
import 'package:tigor_store/core/utils/app_styles.dart';
import 'package:tigor_store/features/home/presentation/cubit/category_products_cubit/category_products_cubit.dart';
import 'package:tigor_store/features/home/presentation/view/components/home_components/custom_category_item.dart';

class CategoryProductsListView extends StatelessWidget {
  const CategoryProductsListView({
    super.key,
    required this.cubit,
  });

  final CategoryProductsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.sizeOf(context).height,
        child: cubit.categoryProducts.isEmpty
            ? const Center(
                child: Text(
                  "No Products",
                  style: Styles.anybody600style16,
                ),
              )
            : GridView.builder(
                itemCount: cubit.categoryProducts.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: .6),
                itemBuilder: (context, index) {
                  return CustomListViewItem(
                    model: cubit.categoryProducts[index],
                  );
                },
              ),
      );
  }
}