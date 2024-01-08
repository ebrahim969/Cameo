import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:tigor_store/core/functions/navigation.dart';
import 'package:tigor_store/core/utils/app_strings.dart';

import 'package:tigor_store/core/widgets/custom_text_button.dart';
import 'package:tigor_store/features/on_boarding/data/functions/on_boarding_visited.dart';
import 'package:tigor_store/features/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:tigor_store/features/on_boarding/presentation/cubit/on_boarding_state.dart';
import 'package:tigor_store/features/on_boarding/presentation/view/components/custom_outlined_button.dart';
import 'package:tigor_store/features/on_boarding/presentation/view/components/custom_smooth_indecator.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final onBoardingCubit = BlocProvider.of<OnBoardingCubit>(context);
    return BlocConsumer<OnBoardingCubit, OnBoardingState>(
      listener: (context, state) {
        if (state is OnBoardingCounter) {
          onBoardingCubit.currentPage + 1;
        }
      },
      builder: (context, state) {
        return Stack(
          alignment: Alignment.center,
          children: [
            LiquidSwipe(
              onPageChangeCallback: onBoardingCubit.onPageChangeCallback,
              liquidController: onBoardingCubit.controller,
              pages: onBoardingCubit.pages,
            ),
            Positioned(
                bottom: 1,
                left: 10,
                child: onBoardingCubit.currentPage == 2
                    ? CustomTextButton(
                        txt: AppString.signUp,
                        onPressed: () {
                          onBoardingVisited();
                          customReplacementNavigate(context, "/SignUpView");
                        },
                      )
                    : CustomTextButton(
                        txt: AppString.skip,
                        onPressed: () => onBoardingCubit.skip(),
                      )),
            Positioned(
              bottom: 60,
              child: CustomOutlinedButton(
                controller: onBoardingCubit.controller,
                onPressed: () {
                  onBoardingCubit.animateToPage();
                },
              ),
            ),
            Positioned(
                bottom: 10,
                child: CustomSmoothIndecator(onBoardingCubit: onBoardingCubit)),
            Positioned(
                bottom: 1,
                right: 10,
                child: onBoardingCubit.currentPage == 2
                    ? CustomTextButton(
                        txt: AppString.signIn,
                        onPressed: () {},
                      )
                    : const Text(""))
          ],
        );
      },
    );
  }
}
