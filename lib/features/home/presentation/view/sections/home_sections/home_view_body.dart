import 'package:flutter/material.dart';
import 'package:tigor_store/features/home/presentation/view/sections/home_sections/custom_all_categories_section.dart';
import 'package:tigor_store/features/home/presentation/view/sections/home_sections/custom_home_slider.dart';
import 'package:tigor_store/features/home/presentation/view/sections/home_sections/custom_mens_category_section.dart';
import 'package:tigor_store/features/home/presentation/view/sections/home_sections/custom_woman_category_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(height: 30),
        ),
        SliverToBoxAdapter(
          child: CustomHomeSlider(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: 16),
        ),
        SliverToBoxAdapter(
          child: CustomAllCategoriesSection(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: 16),
        ),
        SliverToBoxAdapter(
          child: CustomWomanCategorysSection(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: 16),
        ),
        SliverToBoxAdapter(
          child: CustomMensCategorysSection(),
        ),
      ],
    );
  }
}



