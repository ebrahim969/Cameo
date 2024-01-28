import 'package:flutter/material.dart';
import 'package:tigor_store/core/utils/app_images.dart';
import 'package:tigor_store/core/utils/app_styles.dart';

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
