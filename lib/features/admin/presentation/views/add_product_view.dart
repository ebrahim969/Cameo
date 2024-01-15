import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tigor_store/features/admin/presentation/cubit/admin_cubit.dart';
import 'package:tigor_store/features/admin/presentation/views/sections/add_product_view_body.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => AdminCubit()..getAllCategories(),
          child: const AddProductViewBody(),
        ),
      ),
    );
  }
}
