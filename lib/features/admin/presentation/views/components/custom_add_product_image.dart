import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tigor_store/core/utils/app_images.dart';
import 'package:tigor_store/features/admin/presentation/cubit/admin_cubit.dart';

class CustomAddProductImage extends StatelessWidget {
  const CustomAddProductImage({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    AdminCubit cubit = context.read<AdminCubit>();
    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {
        if(state is AddImageFailure)
        {
          Text(state.errMessage);
        }
      },
      builder: (context, state) {
        return InkWell(
        onTap: () async {
          await cubit.uploadImageToStorage();
        },
        child:state is AddImageLoading? 
        const Center(child: CircularProgressIndicator(),)
        :Container(
          height: 250,
          width: 200,
          decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(16)),
          child: state is AddImageSuccess
              ? Image.network(
                  state.imageUrl,
                  fit: BoxFit.cover,
                ):Image.asset(
                  Assets.imagesNotimage,
                  fit: BoxFit.cover,
                ),
        ),
      );
      },
    );
  }
}