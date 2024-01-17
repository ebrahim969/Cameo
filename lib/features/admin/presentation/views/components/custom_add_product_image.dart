import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tigor_store/core/utils/app_colors.dart';
import 'package:tigor_store/core/utils/app_images.dart';
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
              ? ShimmerWidget(height: size.height * 0.4, width: size.width* 0.7,)
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

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({
    super.key,
    required this.height,
    required this.width,
  });
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Shimmer.fromColors(
        baseColor: AppColors.greyColor,
        highlightColor: Colors.white,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColors.greyColor,
          ),
        ),
      ),
    );
  }
}
