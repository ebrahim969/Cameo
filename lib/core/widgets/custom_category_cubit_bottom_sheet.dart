import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tigor_store/core/utils/app_colors.dart';
import 'package:tigor_store/features/admin/presentation/cubit/admin_cubit.dart';

class CustomSelectCategoryBotomSheet extends StatelessWidget {
  const CustomSelectCategoryBotomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AdminCubit cubit = context.read<AdminCubit>();
    return BlocConsumer<AdminCubit, AdminState>(
        listener: (context, state) {},
        builder: (context, state) {
          return state is AllCategoreisLoading
              ? Container()
              : Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 32),
                child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide:
                              const BorderSide(color: AppColors.greyColor)),
                    ),
                    value: cubit.allCategories[0].title,
                    items: cubit.allCategories
                        .map((item) => DropdownMenuItem(
                            value: item.title, child: Text(item.title)))
                        .toList(),
                    onChanged: ((value) {
                      cubit.selectedCategory = value!;
                    })),
              );
        });
  }
}
