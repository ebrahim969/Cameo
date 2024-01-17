import 'package:flutter/material.dart';
import 'package:tigor_store/features/admin/presentation/views/components/custom_add_product_image.dart';
import 'package:tigor_store/features/home/data/model/product_model.dart';

class CustomLoadingProductsWidget extends StatelessWidget {
  const CustomLoadingProductsWidget({super.key, required this.dataList});
    final List<ProductModel> dataList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .3,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: dataList.length,
          itemBuilder: (context, index) {
            return const Padding(
              padding:  EdgeInsets.all(8.0),
              child:  ShimmerWidget(height: 200, width: 150),
            );
          }),
    );
  }
}