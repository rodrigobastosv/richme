import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:richme/src/core/db/db_helper.dart';
import 'package:richme/src/core/repository/user_repository.dart';

import 'app.dart';

class BlocProviderApp extends StatefulWidget {
  @override
  _BlocProviderAppState createState() => _BlocProviderAppState();
}

class _BlocProviderAppState extends State<BlocProviderApp> {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserRepository>(
          create: (_) => UserRepository(DBHelper.instance.db),
        ),
      ],
      child: App(),
    );
  }
}
