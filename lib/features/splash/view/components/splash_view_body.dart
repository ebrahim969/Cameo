import 'package:flutter/material.dart';
import 'package:tigor_store/core/database/cache/cache_helper.dart';
import 'package:tigor_store/core/functions/navigation.dart';
import 'package:tigor_store/core/services/service_locator.dart';
import 'package:tigor_store/core/utils/app_strings.dart';
import 'package:tigor_store/core/utils/app_styles.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    bool onBoardingVisited = getIt<CacheHelper>().getData(key: "OnBoardingVisited") ?? false;
    if(onBoardingVisited == true)
    {
      delayedNavigate(context, "/MainScreenView");
    }else
    {
      delayedNavigate(context, "/OnBoardingView");
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(AppString.appName,
      style: Styles.anybody400style48,),
    );
  }
}

void delayedNavigate(context, path) {
  Future.delayed(const Duration(seconds: 2), () {
    customReplacementNavigate(context, path);
  });
}
