import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tigor_store/category_model.dart';
import 'package:tigor_store/features/home/data/model/product_model.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<ProductModel> newProducts = [];
  List<CategoryModel> allCategories = [];
    String selectedCategory = '';

  Future<void> getNewProducts() async {
    try {
      emit(NewProductLoading());
      await firestore
          .collection("products")
          .where('category', isEqualTo: "new_products")
          .get()
          .then((value) => value.docs.forEach((element) {
                newProducts.add(ProductModel.fromJson(element.data()));
              }));

      emit(NewProductSuccess());
    } on FirebaseException catch (e) {
      emit(NewProductFailure(errMessage: e.toString()));
    }
  }

  Future<void> getAllCategories() async {
    try {
      emit(AllCategoreisLoading());
      await firestore
          .collection("categories")
          .get()
          .then((value) => value.docs.forEach((element) {
                allCategories.add(CategoryModel.fromJson(element.data()));
              }));

      emit(AllCategoriesSuccess());
    } on FirebaseException catch (e) {
      emit(AllCategoriesFailure(errMessage: e.toString()));
    }
  }
}
