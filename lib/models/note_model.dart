class NoteModel {
  int? id;
  int categoryId;
  String title;
  String? description;
  DateTime createdDate;
  String? imagePath;

  NoteModel({
    this.id,
    required this.categoryId,
    required this.title,
    this.description,
    required this.createdDate,
    this.imagePath,
  });

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      id: map['id'],
      categoryId: map['category_id'] ?? -1,
      title: map['title'] ?? '',
      description: map['description'],
      createdDate: DateTime.parse(map['created_date']),
      imagePath: map['image_path'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category_id': categoryId,
      'title': title,
      'description': description,
      'created_date': createdDate.toString(),
      'image_path': imagePath,
    };
  }
}
