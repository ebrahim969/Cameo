import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tigor_store/core/functions/custom_toast.dart';
import 'package:tigor_store/features/home/presentation/cubit/category_products_cubit/category_products_cubit.dart';

class CategoryProductsBody extends StatelessWidget {
  const CategoryProductsBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: 24,
          ),
        ),
        SliverToBoxAdapter(
          child: CustomCategoryProductsListView(),
        )
      ],
    );
  }
}

class CustomCategoryProductsListView extends StatelessWidget {
  const CustomCategoryProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CategoryProductsCubit>();
    return BlocConsumer<CategoryProductsCubit, CategoryProductsState>(
      listener: (context, state) {
        if(state is CategoryProductsFailure)
        {
          showToast(state.errMessage);
        }
      },
      builder: (context, state) {
        return state is CategoryProductsLoading?  
        const CircularProgressIndicator()
        :SizedBox(
          height: MediaQuery.sizeOf(context).height ,
          child: ListView.separated(
              itemBuilder: (context, index) {
                return  ListTile(
                  leading: CircleAvatar(backgroundImage: NetworkImage(cubit.categoryProducts[index].image,)),
                  title: Text(cubit.categoryProducts[index].title),
                  trailing: Text(cubit.categoryProducts[index].price.toString()),
                  subtitle: Text(cubit.categoryProducts[index].productDate),
                );
              },
              separatorBuilder: ((context, index) {
                return const SizedBox(
                  height: 8,
                );
              }),
              itemCount: cubit.categoryProducts.length),
        );
      },
    );
  }
}
