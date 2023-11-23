part of 'login_bloc.dart';

sealed class LoginEvent {}

class DoLoginEvent extends LoginEvent {
  final LoginRequestModel loginRequestModel;

  DoLoginEvent({required this.loginRequestModel});
}
