part of '../sign_in/sign_in_cubit.dart';

@immutable
abstract class SignInState extends Equatable {}

class SignInInitial extends SignInState {
  @override
  List<Object> get props => [];
}

class SignInLoading extends SignInState {
  @override
  List<Object> get props => [];
}

class SignInSuccess extends SignInState {
  SignInSuccess(this.user);

  final UserModel user;

  @override
  List<Object> get props => [user];
}

class SignInFailed extends SignInState {
  @override
  List<Object> get props => [];
}
