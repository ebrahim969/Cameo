import 'package:flutter/material.dart';
import 'package:tigor_store/features/home/presentation/view/components/custom_app_bar.dart';
import 'package:tigor_store/features/home/presentation/view/sections/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80), child: CustomAppBar()),
      body: HomeViewBody(),
    ));
  }
}
