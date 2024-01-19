import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tigor_store/features/admin/data/models/category_model.dart';
import 'package:tigor_store/features/home/presentation/cubit/category_products_cubit/category_products_cubit.dart';
import 'package:tigor_store/features/home/presentation/view/sections/category_products_sections/category_products_body.dart';

class CategoryProductsView extends StatelessWidget {
  const CategoryProductsView({super.key, required this.model});
  final CategoryModel model;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BlocProvider(
        create: (context)
        {
          if(model.title == "All")
          {
            return CategoryProductsCubit()..getAllProducts();
          }else
          {
            return CategoryProductsCubit()..getCtegoryProducts(model.title);
          }
        },
        child: const CategoryProductsBody(),
      ),
    );
  }
}
