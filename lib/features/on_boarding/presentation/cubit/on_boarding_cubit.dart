import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import 'package:tigor_store/core/utils/app_colors.dart';
import 'package:tigor_store/core/utils/app_images.dart';
import 'package:tigor_store/features/on_boarding/data/model/on_boarding_model.dart';
import 'package:tigor_store/features/on_boarding/presentation/cubit/on_boarding_state.dart';
import 'package:tigor_store/features/on_boarding/presentation/view/components/on_boarding_widget.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());

  int currentPage = 0;
  int nextPage = 0;
  final controller = LiquidController();
  final List<Widget> pages = [
    OnBoardingWidget(
      color: AppColors.blakColor,
      model: OnBoardingModel(
        imagePath: Assets.imagesOnBoarding1,
        title: "We provide fashoin trends in islamic clothing",
      ),
    ),
    OnBoardingWidget(
      color: AppColors.blakColor,
      model: OnBoardingModel(
          imagePath: Assets.imagesOnBoarding2,
          title: "You will see yourself as the most beautiful ever"),
    ),
    OnBoardingWidget(
      color: AppColors.blakColor,
      model: OnBoardingModel(
          imagePath: Assets.imagesOnBoarding3,
          title: "It's time to choose the best fashion"),
    ),
  ];

  void onPageChangeCallback(int activeIndex) {
    currentPage = activeIndex;
    emit(OnBoardingCounter());
  }

  void animateToPage()
  {
    nextPage = controller.currentPage+1;
    controller.animateToPage(page: nextPage);
  }

  skip()=> controller.jumpToPage(page: 2);
}
