import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:tigor_store/features/admin/data/models/category_model.dart';
part 'admin_state.dart';

class AdminCubit extends Cubit<AdminState> {
  AdminCubit() : super(AdminInitial());

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Reference referenceRoot = FirebaseStorage.instance.ref();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController productIdController = TextEditingController();
  List<CategoryModel> allCategories = [];
  String selectedCategory = '';
  String imageUrl = '';
  String productDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  Future<void> uploadImageToStorage() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    if (file == null) return;
    String uniqeFileName = DateTime.now().microsecondsSinceEpoch.toString();
    
    //! Step2 : upload to firebase storage
    Reference referenceDirImage = referenceRoot.child('images');
      Reference referenceImageToUpload = referenceDirImage.child(uniqeFileName);
    try {
      emit(AddImageLoading());
      await referenceImageToUpload.putFile(File(file.path));
      imageUrl = await referenceImageToUpload.getDownloadURL();
      log(imageUrl);
      emit(AddImageSuccess(imageUrl: imageUrl));
    } catch (e) {
      AddImageFailure(errMessage: e.toString());
    }
  }

  Future<void> addProductDataToFireStore() async {
    try {
      emit(AddProductLoading());
      Map<String, dynamic> saveData = {
        'category': selectedCategory,
        'image': imageUrl,
        'title': titleController.text,
        'desc': descController.text,
        'price': int.parse(priceController.text),
        'productDate': productDate,
      };

      FirebaseFirestore.instance.collection("products").add(saveData);
      emit(AddProductSuccess());
    } catch (e) {
      emit(AddProductFailure(errMessage: e.toString()));
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
