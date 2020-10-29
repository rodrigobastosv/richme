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
      emit(SignInLoading());
      final user = await repository.signInUser(
          email: 'c@gmail.com', password: '12345678');
      emit(SignInSuccess(user));
    } on Exception {
      emit(SignInFailed());
    }
  }
}