import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:tigor_store/core/utils/app_colors.dart';
import 'package:tigor_store/core/utils/app_images.dart';
import 'package:tigor_store/features/home/presentation/cubit/cubit/home_cubit.dart';
import 'package:tigor_store/features/home/presentation/view/home_view.dart';

PersistentTabController _controller = PersistentTabController();

class MainScreenView extends StatelessWidget {
  const MainScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreens(),
      items: _navBarsItems(),
      controller: _controller,
      backgroundColor: AppColors.blakColor,
      decoration: const NavBarDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      navBarStyle: NavBarStyle.style6,
    );
  }
}

List<Widget> _buildScreens() {
  return [
     BlocProvider(
      create: (context) => HomeCubit()..getNewProducts(),
      child: const HomeView(),
    ),
    Container(),
    Container(),
    Container(),
    Container(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(
        Assets.imagesHomeIconActive,
      ),
      inactiveIcon: SvgPicture.asset(
        Assets.imagesHomeIcon,
      ),
    ),
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(Assets.imagesCartIconActive),
      inactiveIcon: SvgPicture.asset(Assets.imagesCartIcon),
    ),
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(Assets.imagesShoppingBagIconActive),
      inactiveIcon: SvgPicture.asset(Assets.imagesShoppingBagIcon),
    ),
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(Assets.imagesHeartIconActive),
      inactiveIcon: SvgPicture.asset(Assets.imagesHeartIcon),
    ),
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(Assets.imagesProfileIconActive),
      inactiveIcon: SvgPicture.asset(Assets.imagesProfileIcon),
    ),
  ];
}
