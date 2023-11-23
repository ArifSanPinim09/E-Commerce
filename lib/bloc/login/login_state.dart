part of 'login_bloc.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final AuthResponseModel authReponseModel;

  LoginSuccess({required this.authReponseModel});
}

final class LoginError extends LoginState {}
