// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tigor_store/core/utils/app_strings.dart';
import 'package:tigor_store/features/home/data/model/product_model.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<ProductModel> newProducts = [];
  List<ProductModel> mensProducts = [];
  List<ProductModel> weamensProducts = [];

  Future<void> getNewProducts() async {
    try {
      emit(NewProductLoading());
      await firestore.collection( FirebaseStrings.newproducts).get().then(
            (value) => value.docs.forEach(
              (element) {
                newProducts.add(
                  ProductModel.fromJson(element.data()),
                );
              },
            ),
          );
          emit(NewProductSuccess());
    } on FirebaseException catch (e) 
    {
      emit(NewProductFailure(errMessage: e.toString()));
    }
  }

  Future<void> getWoamensProducts() async {
    try {
      emit(NewProductLoading());
      await firestore.collection("new_products").get().then(
            (value) => value.docs.forEach(
              (element) {
                newProducts.add(
                  ProductModel.fromJson(element.data()),
                );
              },
            ),
          );
          emit(NewProductSuccess());
    } on Exception catch (e) 
    {
      emit(NewProductFailure(errMessage: e.toString()));
    }
  }

  Future<void> getMensProducts() async {
    try {
      emit(NewProductLoading());
      await firestore.collection("new_products").get().then(
            (value) => value.docs.forEach(
              (element) {
                newProducts.add(
                  ProductModel.fromJson(element.data()),
                );
              },
            ),
          );
          emit(NewProductSuccess());
    } on Exception catch (e) 
    {
      emit(NewProductFailure(errMessage: e.toString()));
    }
  }
}
