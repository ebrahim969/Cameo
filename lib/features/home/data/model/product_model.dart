import 'package:tigor_store/core/models/data_model.dart';

class ProductModel extends DataModel {
  final int price;
  final String desc;

  ProductModel(
      {required this.price,
      required super.image,
      required super.title,
      required this.desc});

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      title: jsonData['title'],
      image: jsonData['image'],
      price: jsonData['price'],
      desc: jsonData['desc'],
    );
  }
}
