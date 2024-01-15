import 'package:flutter/material.dart';
import 'package:tigor_store/core/utils/app_colors.dart';
import 'package:tigor_store/core/utils/app_styles.dart';
import 'package:tigor_store/features/admin/presentation/views/sections/custom_add_product_form.dart';

class AddProductViewBody extends StatelessWidget {
  const AddProductViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 16,
          ),
        ),
        SliverToBoxAdapter(
          child: Center(
              child: Text(
            "Add Product",
            style:
                Styles.anybody400style24.copyWith(color: AppColors.blakColor),
          )),
        ),
        const SliverToBoxAdapter(
          child: CustomAddProductForm(),
        )
      ],
    );
  }
}
