import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:richme/src/core/model/user_model.dart';
import 'package:richme/src/core/repository/user_repository.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({
    @required this.repository,
  })  : assert(repository != null),
        super(SignInInitial());

  UserRepository repository;

  Future<void> signInUser({
    String email,
    String password,
  }) async {
    try {
      emit(StartedSignInAnimation());
      await Future.delayed(Duration(seconds: 1));
      final user = await repository.signInUser(
        email: email,
        password: password,
      );
      emit(SignInSuccess(user));
    } on Exception {
      emit(SignInFailed());
    }
  }
}
