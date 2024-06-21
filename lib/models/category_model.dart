class CategoryModel {
  int? id;
  String categoryName;

  CategoryModel({this.id, required this.categoryName});

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] ?? -1,
      categoryName: map['category_name'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'category_name': categoryName};
  }
}
