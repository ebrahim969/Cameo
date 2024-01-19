import 'package:flutter/material.dart';
import 'package:tigor_store/core/utils/app_colors.dart';
import 'package:tigor_store/core/utils/app_images.dart';
import 'package:tigor_store/core/utils/app_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16))),
      toolbarHeight: 80,
      backgroundColor: AppColors.blakColor,
      actions: const [
        Text(
          "Hello Mona",
          style: Styles.anybody400style16,
        ),
        SizedBox(
          width: 16,
        ),
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(Assets.imagesModel18),
          ),
        ),
      ],
      leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu_rounded,
            color: AppColors.primaryColor,
          )),
    );
  }
  
  @override
  Size get preferredSize => throw UnimplementedError();
}
