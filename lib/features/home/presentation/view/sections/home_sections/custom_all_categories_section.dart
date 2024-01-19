import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tigor_store/core/functions/custom_toast.dart';
import 'package:tigor_store/features/home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:tigor_store/features/home/presentation/view/components/home_components/custom_categorys_header.dart';
import 'package:tigor_store/features/home/presentation/view/components/home_components/custom_home_category_list_view.dart';
import 'package:tigor_store/features/home/presentation/view/components/home_components/cutsom_home_category_list_view_loading.dart';

class CustomAllCategoriesSection extends StatelessWidget {
  const CustomAllCategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
      if (state is GetCategoriesFailure) {
        showToast(state.errMessage);
      }
    }, builder: (context, state) {
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
            child: state is GetCategoriesLoading
                ? const CustomHomeCategoryListViewLoading()
                : CustomHomeCategoryListView(cubit: cubit),
          ),
        ],
      );
    });
  }
}




