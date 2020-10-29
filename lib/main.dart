import 'package:flutter/material.dart';
import 'package:richme/src/app/bloc_provider_app.dart';
import 'package:richme/src/core/db/db_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDB();
  runApp(BlocProviderApp());
}
