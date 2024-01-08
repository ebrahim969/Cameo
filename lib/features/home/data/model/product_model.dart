class ProductModel {
  final String title;
  final String image;
  final int price;

  ProductModel({required this.title, required this.image, required this.price});

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      title: jsonData['title'],
      image: jsonData['image'],
      price: jsonData['price'],
    );
  }
}
