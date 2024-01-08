import 'package:go_router/go_router.dart';
import 'package:tigor_store/features/auth/presentation/view/sign_up_view.dart';
import 'package:tigor_store/features/home/main_screen.dart';
import 'package:tigor_store/features/home/presentation/view/home_view.dart';
import 'package:tigor_store/features/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:tigor_store/features/splash/view/splash_view.dart';

final GoRouter routes = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: "/OnBoardingView",
      builder: (context, state) => const OnBoardingView(),
    ),
    GoRoute(
      path: "/SignUpView",
      builder: (context, state) => const SignUpView(),
    ),
    GoRoute(
      path: "/MainScreenView",
      builder: (context, state) => const MainScreenView(),
    ),
    GoRoute(
      path: "/HomeView",
      builder: (context, state) => const HomeView(),
    ),
  ],
);
