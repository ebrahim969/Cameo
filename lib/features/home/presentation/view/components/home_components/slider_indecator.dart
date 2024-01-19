import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tigor_store/core/utils/app_colors.dart';
import 'package:tigor_store/features/home/data/model/slider_model.dart';

  Widget sliderIndecator(var activeIndex) {
    return AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: sliderImages.length,
        effect: const SwapEffect(
          dotColor: AppColors.blakColor,
          activeDotColor: AppColors.primaryColor,
        ));
  }
