import 'package:flutter/material.dart';
import 'package:tigor_store/core/functions/navigation.dart';
import 'package:tigor_store/core/widgets/custom_text_button.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Center(
            child: CustomTextButton(txt: "Navigate To Home", onPressed: (){
              customReplacementNavigate(context, "/MainScreenView");
            } ),
          ),
        )
      ],
    );
  }
}