import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tigor_store/core/utils/app_styles.dart';
import 'package:tigor_store/features/home/presentation/cubit/category_products_cubit/category_products_cubit.dart';
import 'package:tigor_store/features/home/presentation/view/components/category_products_components/category_products_list_view.dart';

class CustomCategoryProductsSection extends StatelessWidget {
  const CustomCategoryProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CategoryProductsCubit>();
    return Column(
      children: [
        BlocConsumer<CategoryProductsCubit, CategoryProductsState>(
          listener: (context, state) {
            if (state is CategoryProductsFailure) {
              Center(
                  child: Text(
                state.errMessage,
                style: Styles.anybody600style16,
              ));
            }
          },
          builder: (context, state) {
            return state is CategoryProductsLoading
                ? const Center(child: CircularProgressIndicator())
                : CategoryProductsListView(cubit: cubit);
          },
        ),
      ],
    );
  }
}