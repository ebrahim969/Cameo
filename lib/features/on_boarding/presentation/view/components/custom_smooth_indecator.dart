import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tigor_store/core/utils/app_colors.dart';
import 'package:tigor_store/features/on_boarding/presentation/cubit/on_boarding_cubit.dart';

class CustomSmoothIndecator extends StatelessWidget {
  const CustomSmoothIndecator({
    super.key,
    required this.onBoardingCubit,
  });

  final OnBoardingCubit onBoardingCubit;

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: onBoardingCubit.currentPage,
      count: onBoardingCubit.pages.length,
      effect: const WormEffect(
          activeDotColor: AppColors.primaryColor,
          dotHeight: 5),
    );
  }
}

