import 'package:flutter/material.dart';
import 'package:tigor_store/core/widgets/custom_shimmer_widget.dart';

class CustomHomeCategoryListViewLoading extends StatelessWidget {
  const CustomHomeCategoryListViewLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return const Column(
            children: [
              ShimmerWidget(height: 80, width: 80, circle: true, marginSize: 8,),
              SizedBox(height: 8,),
              ShimmerWidget(height: 8, width: 35, circle: false,),
            ],
          );
        });
  }
}