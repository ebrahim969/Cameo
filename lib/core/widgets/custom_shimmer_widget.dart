import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tigor_store/core/utils/app_colors.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({
    super.key,
    required this.height,
    required this.width,
    required this.circle, this.marginSize,
  });
  final double height;
  final double width;
  final double? marginSize;
  final bool circle;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Shimmer.fromColors(
        baseColor: AppColors.greyColor.withOpacity(0.3),
        highlightColor: AppColors.greyColor.withOpacity(0.1),
        child: Container(
          margin: EdgeInsets.all(marginSize?? 0),
          width: width,
          height: height,
          decoration: circle
              ? const BoxDecoration(
                color: AppColors.blakColor,
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
