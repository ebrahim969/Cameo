import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tigor_store/core/utils/app_colors.dart';
import 'package:tigor_store/features/home/presentation/cubit/cubit/home_cubit.dart';

class CustomSelectCategoryBotomSheet extends StatelessWidget {
  const CustomSelectCategoryBotomSheet({
    super.key,
    required this.categoryCubit,
  });

  final HomeCubit categoryCubit;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
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
                    value: categoryCubit.allCategories[0].title,
                    items: categoryCubit.allCategories
                        .map((item) => DropdownMenuItem(
                            value: item.title, child: Text(item.title)))
                        .toList(),
                    onChanged: ((value) {
                      categoryCubit.selectedCategory = value!;
                    })),
              );
        });
  }
}
