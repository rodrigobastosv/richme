import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:richme/src/core/cubit/sign_up/sign_up_cubit.dart';
import 'package:richme/src/core/repository/user_repository.dart';

import 'sign_up_view.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpCubit>(
      create: (_) => SignUpCubit(
        repository: context.repository<UserRepository>(),
      ),
      child: SignUpView(),
    );
  }
}
