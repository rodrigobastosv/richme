import 'package:richme/src/core/db/tables/tables.dart';

final v1Migrations = [
  '''
  CREATE TABLE $USER_TABLE (
    $USER_TABLE_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    $USER_TABLE_NAME TEXT,
    $USER_TABLE_EMAIL TEXT,
    $USER_TABLE_PASSWORD TEXT
  );
  '''
];
