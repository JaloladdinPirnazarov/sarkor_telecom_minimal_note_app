import '../utils/importer.dart';

class DbHelper {
  static final DbHelper instance = DbHelper._();
  static Database? _database;

  DbHelper._();

  Future<Database> _initDatabase() async {
    String path = await getDatabasesPath();
    const String createText = 'CREATE TABLE';
    return openDatabase(
      join(path, 'sarkor_tlecom_minimal_note_app.db'),
      onCreate: (db, version) async {
        // Create category table
        await db.execute('''
          $createText category (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            category_name TEXT NOT NULL )
        ''');

        // Create note table
        await db.execute('''
          $createText note (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            category_id INTEGER,
            title TEXT NOT NULL,
            description TEXT,
            created_date TEXT NOT NULL,
            image_path TEXT )
        ''');
      },
      version: 1,
    );
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }
}
