import 'package:tigor_store/core/models/data_model.dart';

class ProductModel extends DataModel {
  final int price;
  final String desc;
  final String productDate;

  ProductModel(
      {required this.price,
      required String image,
      required String title,
      required this.desc,
      required this.productDate,}): super(image: image, title: title);

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      title: jsonData['title'],
      image: jsonData['image'],
      price: jsonData['price'],
      desc: jsonData['desc'],
      productDate: jsonData['productDate'],
    );
  }
}
