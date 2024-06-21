import '../../utils/importer.dart';

class CategoryDataManager{
  final DbHelper _databaseHelper = DbHelper.instance;

  final String _tableName = 'category';

  Future<void> createCategory(CategoryModel categoryModel)async {
    Database db = await _databaseHelper.database;
    await db.insert(_tableName, categoryModel.toMap());
  }

  Future<List<CategoryModel>> readCategories()async{
    Database db = await _databaseHelper.database;
    final List<Map<String, dynamic>> map = await db.query(_tableName);
    return List.generate(map.length, (index) => CategoryModel.fromMap(map[index]));
  }

  Future<void> updateCategory(CategoryModel categoryModel)async{
    Database db = await _databaseHelper.database;
    await db.update(_tableName, categoryModel.toMap(), where: 'id = ?', whereArgs: [categoryModel.id!]);
  }

  Future<void> deleteCategory(int id)async{
    Database db = await _databaseHelper.database;
    await db.delete(_tableName, where: 'id = ?', whereArgs: [id]);
  }

}