import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:tigor_store/core/utils/app_strings.dart';
import 'package:tigor_store/features/home/data/model/product_model.dart';

part 'category_products_state.dart';

class CategoryProductsCubit extends Cubit<CategoryProductsState> {
  CategoryProductsCubit() : super(CategoryProductsInitial());

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<ProductModel> categoryProducts = [];

  Future<void> getCtegoryProducts(String categoryName) async {
    try {
      emit(CategoryProductsLoading());
      await firestore
          .collection(FirebaseStrings.allProducts)
          .where('category', isEqualTo: categoryName)
          .get()
          .then((value) => value.docs.forEach((element) {
                categoryProducts.add(ProductModel.fromJson(element.data()));
              }));
      emit(CategoryProductsSuccess());
    } on FirebaseException catch (e) {
      emit(CategoryProductsFailure(errMessage: e.toString()));
    } catch (e) {
      emit(CategoryProductsFailure(errMessage: e.toString()));
    }
  }

  Future<void> getAllProducts() async {
    try {
      emit(AllProductLoading());
      await firestore.collection(FirebaseStrings.allProducts).get().then(
            (value) => value.docs.forEach((element) {
              categoryProducts.add(ProductModel.fromJson(element.data()));
            }),
          );
      emit(AllProductSuccess());
    } on FirebaseException catch (e) {
      emit(AllProductFailure(errMessage: e.toString()));
    } catch (e) {
      emit(AllProductFailure(errMessage: e.toString()));
    }
  }
}
