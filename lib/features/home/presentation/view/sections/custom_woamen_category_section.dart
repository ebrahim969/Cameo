import 'package:flutter/material.dart';
import 'package:tigor_store/core/utils/app_strings.dart';
import 'package:tigor_store/features/home/presentation/view/components/custom_category_list_view.dart';
import '../components/custom_categorys_header.dart';

class CustomWoamenCategorysSection extends StatelessWidget {
  const CustomWoamenCategorysSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomCategorysHeader(
            title: AppString.woamensWear,
            subTitle: AppString.superSummerSale,
            trailing: AppString.viewAll),
            CustomCategoryListView(
              dataList: [],
            )
      ],
    );
  }
}