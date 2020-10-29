import 'package:richme/src/core/db/tables/tables.dart';
import 'package:richme/src/core/exception/sql_exception.dart';
import 'package:richme/src/core/exception/user_not_found_exception.dart';
import 'package:richme/src/core/model/user_model.dart';
import 'package:richme/src/core/utils/crypt_utils.dart';
import 'package:sqflite/sqflite.dart';

class UserRepository {
  UserRepository(this.db);

  final Database db;

  Future<void> signUpUser(UserModel user) async {
    try {
      final userWithEncriptedPassword = user.copyWith(
        password: basicEncription(user.password),
      );
      db.insert(USER_TABLE, userWithEncriptedPassword.toMap());
    } on Exception {
      throw SqlException();
    }
  }

  Future<UserModel> signInUser({
    String email,
    String password,
  }) async {
    try {
      final encriptedPassword = basicEncription(password);
      final result = await db.query(
        USER_TABLE,
        where: '''
            $USER_TABLE_EMAIL = \'$email\' AND 
            $USER_TABLE_PASSWORD = \'$encriptedPassword\'
            ''',
      );
      if (result.isNotEmpty) {
        return UserModel.fromMap(result[0]);
      } else {
        throw UserNotFoundException();
      }
    } on Exception {
      throw SqlException();
    }
  }
}
