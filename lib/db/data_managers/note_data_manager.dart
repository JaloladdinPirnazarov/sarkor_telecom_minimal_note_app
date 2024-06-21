import '../../utils/importer.dart';

class NoteDataManager {
  final DbHelper _databaseHelper = DbHelper.instance;

  final String _tableName = 'note';

  Future<void> createNote(NoteModel noteModel) async {
    Database db = await _databaseHelper.database;
    await db.insert(_tableName, noteModel.toMap());
  }

  Future<List<NoteModel>> readAllNotes() async {
    Database db = await _databaseHelper.database;
    final List<Map<String, dynamic>> map = await db.query(_tableName);
    return List.generate(map.length, (index) => NoteModel.fromMap(map[index]));
  }

  Future<List<NoteModel>> readNotesByCategoryId(int categoryId) async {
    Database db = await _databaseHelper.database;
    final List<Map<String, dynamic>> map = await db
        .query(_tableName, where: 'category_id = ?', whereArgs: [categoryId]);
    return List.generate(map.length, (index) => NoteModel.fromMap(map[index]));
  }

  Future<void> updateNote(NoteModel noteModel) async {
    Database db = await _databaseHelper.database;
    await db.update(_tableName, noteModel.toMap(),
        where: 'id = ?', whereArgs: [noteModel.id!]);
  }

  Future<void> deleteNote(int noteId) async {
    Database db = await _databaseHelper.database;
    await db.delete(_tableName, where: 'id = ?', whereArgs: [noteId]);
  }

  Future<void> deleteNoteByCategoryId(int categoryId) async {
    Database db = await _databaseHelper.database;
    await db
        .delete(_tableName, where: 'category_id = ?', whereArgs: [categoryId]);
  }
}
