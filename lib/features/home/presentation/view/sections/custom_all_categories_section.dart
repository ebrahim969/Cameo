import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tigor_store/core/widgets/custom_shimmer_widget.dart';
import 'package:tigor_store/features/home/presentation/view/components/custom_categorys_header.dart';
import 'package:tigor_store/features/home/presentation/view/components/custom_home_category_item.dart';

import '../../cubit/home_cubit/home_cubit.dart';

class CustomAllCategoriesSection extends StatelessWidget {
  const CustomAllCategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Column(
            children: [
              const CustomCategorysHeader(
                title: "Categories",
                subTitle: "All Islamic Categories is Avillable",
                trailing: "View All",
              ),
              SizedBox(
                height: 120,
                width: double.infinity,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: cubit.getCategories.length,
                    itemBuilder: ((context, index) {
                      return state is GetCategoriesLoading
                          ? const ShimmerWidget(
                              height: 70, width: 70, circle: true)
                          : CustomCategoryItem(
                              model: cubit.getCategories[index],
                            );
                    })),
              ),
            ],
          );
        });
  }
}
