import 'package:flutter/material.dart';
import 'package:tigor_store/features/home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:tigor_store/features/home/presentation/view/components/home_components/custom_home_category_item.dart';

class CustomHomeCategoryListView extends StatelessWidget {
  const CustomHomeCategoryListView({
    super.key,
    required this.cubit,
  });

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: cubit.getCategories.length,
        itemBuilder: ((context, index) {
          return CustomHomeCategoryItem(
            model: cubit.getCategories[index],
          );
        }));
  }
}