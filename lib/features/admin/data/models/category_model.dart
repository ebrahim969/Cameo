class CategoryModel {
  final String title;
  final String imageUrl;

  CategoryModel({required this.title, required this.imageUrl});

  factory CategoryModel.fromJson(jsonData) {
    return CategoryModel(title: jsonData['title'], imageUrl: jsonData['image']);
  }
}
