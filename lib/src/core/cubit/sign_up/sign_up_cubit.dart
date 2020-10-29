import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:richme/src/core/model/user_model.dart';
import 'package:richme/src/core/repository/user_repository.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({
    @required this.repository,
  })  : assert(repository != null),
        super(SignUpInitial());

  final UserRepository repository;

  Future<void> signUpUser({
    @required String name,
    @required String email,
    @required String password,
  }) async {
    assert(name != null && name != '');
    assert(email != null && email != '');
    assert(password != null && password != '');
    assert(password.length >= 6, 'The password must be at least 6 characters');

    final user = UserModel(
      name: name,
      email: email,
      password: password,
    );
    try {
      emit(SignUpLoading());
      await repository.signUpUser(user);
      emit(SignUpSuccess());
    } on Exception {
      emit(SignUpFailed());
    }
  }
}
