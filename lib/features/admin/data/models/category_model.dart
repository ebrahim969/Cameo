import 'package:tigor_store/core/models/data_model.dart';

class CategoryModel extends DataModel {

  CategoryModel({required String title, required String image}) : super(image: image, title: title);

  factory CategoryModel.fromJson(jsonData) {
    return CategoryModel(title: jsonData['title'], image: jsonData['image']);
  }
}
