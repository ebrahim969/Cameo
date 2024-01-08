import 'package:flutter/material.dart';
import 'package:tigor_store/core/database/cache/cache_helper.dart';
import 'package:tigor_store/core/functions/navigation.dart';
import 'package:tigor_store/core/services/service_locator.dart';
import 'package:tigor_store/core/widgets/custom_text_button.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: CustomTextButton(txt: "Delete Cache", onPressed: (){
            getIt<CacheHelper>().clearData();
            customReplacementNavigate(context, "/");
          },));
  }
}