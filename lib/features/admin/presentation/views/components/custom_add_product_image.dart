import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tigor_store/core/utils/app_images.dart';
import 'package:tigor_store/core/widgets/custom_shimmer_widget.dart';
import 'package:tigor_store/features/admin/presentation/cubit/admin_cubit.dart';

class CustomAddProductImage extends StatelessWidget {
  const CustomAddProductImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    AdminCubit cubit = context.read<AdminCubit>();
    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {
        if (state is AddImageFailure) {
          Text(state.errMessage);
        }
      },
      builder: (context, state) {
        return InkWell(
          onTap: () async {
            await cubit.uploadImageToStorage();
          },
          child: 
          state is AddImageLoading
              ? ShimmerWidget(height: size.height * 0.4, width: size.width* 0.7, circle: false,)
              : Container(
                  height: size.height * 0.4,
                  width: size.height * 0.35,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(16)),
                  child: state is AddImageSuccess
                      ? CachedNetworkImage(
                        fit: BoxFit.cover,
                          imageUrl: state.imageUrl,
                          placeholder: (context, url) => ShimmerWidget(
                            height: size.height * 0.4,
                            width: size.height * 0.4,
                            circle: false,
                          ),
                        )
                      : Image.asset(
                          Assets.imagesNotimage,
                          fit: BoxFit.cover,
                        ),
                ),
        );
      },
    );
  }
}


