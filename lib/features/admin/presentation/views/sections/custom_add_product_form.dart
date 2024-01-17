import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tigor_store/core/widgets/custom_category_cubit_bottom_sheet.dart';
import 'package:tigor_store/features/admin/presentation/cubit/admin_cubit.dart';
import 'package:tigor_store/features/admin/presentation/views/components/custom_add_product_image.dart';
import 'package:tigor_store/features/admin/presentation/views/components/custom_add_product_text_feilds.dart';

class CustomAddProductForm extends StatefulWidget {
  const CustomAddProductForm({super.key});

  @override
  State<CustomAddProductForm> createState() => _CustomAddProductFormState();
}

class _CustomAddProductFormState extends State<CustomAddProductForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    AdminCubit cubit = context.read<AdminCubit>();
    return Form(
        key: formKey,
        child: Column(
          children: [
            const SizedBox(height: 16,),
            const CustomAddProductImage(),
            const CustomSelectCategoryBotomSheet(),
            const CustomAddProductTextFeilds(),
            const SizedBox(
              height: 16,
            ),
            BlocConsumer<AdminCubit, AdminState>(listener: (context, state) {
              if (state is AddProductFailure) {
                Text(state.errMessage);
              } else if (state is AddProductSuccess) {
                cubit.titleController.text = '';
                cubit.descController.text = '';
                cubit.priceController.text = '';
                cubit.imageUrl = '';  
              }
            }, builder: (context, state) {
              return ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      await cubit.addProductDataToFireStore();
                    }
                  },
                  child: state is AddProductLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : const Text("Send Data"));
            })
          ],
        ));
  }
}
