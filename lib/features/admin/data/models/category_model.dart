class CategoryModel
{
  final String title;

  CategoryModel({required this.title});

  factory CategoryModel.fromJson(jsonData)
  {
    return CategoryModel(title: jsonData['title']);
  }
}