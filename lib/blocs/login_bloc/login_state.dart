part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccessfulState extends LoginState {}

class LoginFailureState extends LoginState {
  final String message;

  LoginFailureState({required this.message});
}

class LoginLoadingState extends LoginState {}
