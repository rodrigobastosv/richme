import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:richme/src/core/cubit/sign_in/sign_in_cubit.dart';

class SignInView extends StatefulWidget {
  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SignInCubit, SignInState>(
        builder: (_, state) {
          if (state is SignInInitial) {
            return ListView.builder(
              itemBuilder: null,
            );
          }
          if (state is SignInSuccess) {
            final user = state.user;
            print(user);
            return Text('bom');
          }
          if (state is SignInFailed) {
            return Text('ruim');
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
