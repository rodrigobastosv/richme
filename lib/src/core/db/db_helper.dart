import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'migrations/migrations.dart';

class DBHelper {
  static const String DB_NAME = "rm.db";
  static const int DB_VERSION = 1;

  DBHelper._();

  static final DBHelper instance = DBHelper._();

  static Database _db;

  Database get db => _db;

  static Future<void> initDB() async {
    final dbPath = await getDatabasesPath();
    String path = join(dbPath, DB_NAME);

    _db = await openDatabase(
      path,
      version: DB_VERSION,
      onCreate: onCreateDB,
    );
  }

  static Future<void> onCreateDB(Database db, int version) async {
    switch (version) {
      case 1:
        await runMigrations(db, v1Migrations);
        break;
      default:
    }
  }

  static Future<void> runMigrations(Database db, List<String> migrations) async {
    migrations.forEach((migration) async =>  await db.execute(migration));
  }
}
