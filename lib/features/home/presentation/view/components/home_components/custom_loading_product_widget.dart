import 'package:flutter/material.dart';
import 'package:tigor_store/core/widgets/custom_shimmer_widget.dart';

class CustomLoadingProductsWidget extends StatelessWidget {
  const CustomLoadingProductsWidget({super.key,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .35,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            return const Padding(
              padding:  EdgeInsets.all(8.0),
              child:  Column(
                children: [
                  ShimmerWidget(height: 200, width: 150, circle: false,marginSize: 8,),
                  SizedBox(height: 4,),
                  ShimmerWidget(height: 10, width: 100, circle: false,),
                  SizedBox(height: 4,),
                  ShimmerWidget(height: 15, width: 80, circle: false,),
                ],
              ),
            );
          }),
    );
  }
}