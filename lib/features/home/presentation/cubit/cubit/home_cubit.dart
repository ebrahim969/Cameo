import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tigor_store/features/home/data/model/product_model.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<ProductModel> womanProducts = [];
  List<ProductModel> mensProducts = [];  

  Future <void> getHomeProducts() async
  {
    await getWomensProducts();
    await getMensProducts();
  }
  Future<void> getWomensProducts() async {
    try {
      emit(WomansProductLoading());
      await firestore
          .collection("products")
          .where('category', isEqualTo: "Woman's Wear")
          .get()
          .then((value) => value.docs.forEach((element) {
                womanProducts.add(ProductModel.fromJson(element.data()));
              }));

      emit(WomansProductSuccess());
    } on FirebaseException catch (e) {
      emit(WomansProductFailure(errMessage: e.toString()));
    }
  }
  Future<void> getMensProducts() async {
    try {
      emit(MensProductLoading());
      await firestore
          .collection("products")
          .where('category', isEqualTo: "Men's Wear")
          .get()
          .then((value) => value.docs.forEach((element) {
                mensProducts.add(ProductModel.fromJson(element.data()));
              }));

      emit(MensProductSuccess());
    } on FirebaseException catch (e) {
      emit(MensProductFailure(errMessage: e.toString()));
    }
  }
}
