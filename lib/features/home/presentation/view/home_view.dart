import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tigor_store/core/utils/app_images.dart';
import 'package:tigor_store/core/utils/app_styles.dart';
import 'package:tigor_store/features/home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:tigor_store/features/home/presentation/view/components/home_components/custom_app_bar.dart';
import 'package:tigor_store/features/home/presentation/view/sections/home_sections/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(80), child: CustomAppBar()),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if(state is InternetNotConnectedState)
          {
            return NoInternetWidget(message: state.mesage,);
            
          }else 
          {
            return const HomeViewBody();
          }
        },
      ),
    ));
  }
}

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(Assets.imagesUndrawJustBrowsingReOfnd),
        Text(message, style: Styles.anybodyBoldstyle14,)
      ],
    );
  }
}
