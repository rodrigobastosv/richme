import 'package:crypt/crypt.dart';

String basicEncription(String value) => Crypt.sha256(
      value,
      salt: 'salt',
      rounds: 5,
    ).toString();