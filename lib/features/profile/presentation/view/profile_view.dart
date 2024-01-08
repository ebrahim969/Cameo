import 'package:flutter/material.dart';
import 'package:tigor_store/features/profile/presentation/view/sections/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
          body: ProfileViewBody(),
    );
  }
}