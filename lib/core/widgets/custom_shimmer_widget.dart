import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tigor_store/core/utils/app_colors.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({
    super.key,
    required this.height,
    required this.width,
    required this.circle,
  });
  final double height;
  final double width;
  final bool circle;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Shimmer.fromColors(
        baseColor: AppColors.greyColor,
        highlightColor: Colors.white,
        child: Container(
          width: width,
          height: height,
          decoration: circle
              ? const BoxDecoration(
                  shape: BoxShape.circle,
                )
              : BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.greyColor,
                ),
        ),
      ),
    );
  }
}
