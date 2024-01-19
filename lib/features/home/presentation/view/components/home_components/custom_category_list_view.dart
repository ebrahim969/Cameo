import 'package:flutter/material.dart';
import 'package:tigor_store/features/home/data/model/product_model.dart';
import 'package:tigor_store/features/home/presentation/view/components/home_components/custom_category_item.dart';

class CustomCategoryListView extends StatelessWidget {
  const CustomCategoryListView({super.key, required this.dataList, });
  final List<ProductModel> dataList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .35,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: dataList.length,
          itemBuilder: (context, index) {
            return  CustomListViewItem(
              model: dataList[index],
            );
          }),
    );
  }
}