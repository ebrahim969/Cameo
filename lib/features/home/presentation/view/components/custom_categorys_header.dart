import 'package:flutter/material.dart';
import 'package:tigor_store/core/utils/app_colors.dart';
import 'package:tigor_store/core/utils/app_styles.dart';

class CustomCategorysHeader extends StatelessWidget {
  const CustomCategorysHeader({super.key, required this.title, required this.subTitle, required this.trailing});
  
  final String title , subTitle, trailing;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        ListTile(
            title: Text(
              title,
              style: Styles.anybodyBoldstyle28.copyWith(fontSize: 24),
            ),
            subtitle: Text(
              subTitle,
              style: Styles.anybody400style11,
            ),
            trailing: TextButton(
              onPressed: () {},
              child: Text(
                trailing,
                style:
                    Styles.anybody400style11.copyWith(color: AppColors.blakColor),
              ),
            )),
            Container(
              height: 80,
              width: 10,
              decoration:const BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(16), topRight: Radius.circular(16))
              ),
            )
      ],
    );
  }
}