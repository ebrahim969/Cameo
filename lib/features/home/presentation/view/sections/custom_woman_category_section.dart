import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tigor_store/core/utils/app_strings.dart';
import 'package:tigor_store/features/home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:tigor_store/features/home/presentation/view/components/custom_category_list_view.dart';
import 'package:tigor_store/features/home/presentation/view/components/custom_loading_product_widget.dart';
import '../components/custom_categorys_header.dart';

class CustomWomanCategorysSection extends StatelessWidget {
  const CustomWomanCategorysSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomCategorysHeader(
          title: AppString.woamensWear,
          subTitle: AppString.youvNeverSeenItBefore,
          trailing: AppString.viewAll,
        ),
        BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is WomansProductFailure) {
              Text(state.errMessage);
            }
          },
          builder: (context, state) {
            return state is WomansProductLoading
                ? CustomLoadingProductsWidget(
                    dataList: context.read<HomeCubit>().womanProducts,
                  )
                : CustomCategoryListView(
                    dataList: context.read<HomeCubit>().womanProducts,
                  );
          },
        )
      ],
    );
  }
}
