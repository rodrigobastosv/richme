import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:richme/src/core/cubit/sign_in/sign_in_cubit.dart';
import 'package:richme/src/core/repository/user_repository.dart';

import 'sign_in_view.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInCubit>(
      create: (_) => SignInCubit(
        repository: context.repository<UserRepository>(),
      ),
      child: SignInView(),
    );
  }
}
