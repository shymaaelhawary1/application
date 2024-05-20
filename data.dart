import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class DatabaseProvider {
  static const String tableName = 'reviews';

  static Future<Database> createDatabase() async {
    String path = await getDatabasesPath();
    String databasePath = join(path, 'reviews.db');

    return openDatabase(
      databasePath,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
        CREATE TABLE $tableName (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          rating INTEGER,
          feedback TEXT,
          reason TEXT,
          description TEXT
        )
        ''');
      },
    );
  }

  static Future<void> insertReview({
    required int rating,
    required String feedback,
    required String reason,
    required String description,
  }) async {
    Database database = await createDatabase();
    await database.insert(
      tableName,
      {
        'rating': rating,
        'feedback': feedback,
        'reason': reason,
        'description': description,
      },
    );
    await database.close();
  }
}

