import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tigor_store/core/widgets/custom_text_feild.dart';
import 'package:tigor_store/features/admin/presentation/cubit/admin_cubit.dart';

class CustomAddProductTextFeilds extends StatelessWidget {
  const CustomAddProductTextFeilds({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AdminCubit cubit = context.read<AdminCubit>();
    return Column(
      children: [
        CustomTextFormField(
          labelText: "Product Id",
          controller: cubit.productIdController
        ),
        CustomTextFormField(
          labelText: "title",
          controller: cubit.titleController,
        ),
        CustomTextFormField(
          labelText: "desc",
          maxLines: 3,
          controller: cubit.descController,
        ),
        CustomTextFormField(
          labelText: "price",
          controller: cubit.priceController,
        ),
        CustomTextFormField(
          labelText: "Product Date",
          controller: TextEditingController(text: cubit.productDate),
          enabled: false,
        ),
      ],
    );
  }
}