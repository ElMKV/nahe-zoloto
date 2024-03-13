part of 'auth_bloc.dart';

abstract class AuthEvent {}

class AuthInit extends AuthEvent {}

class AuthMsgErr extends AuthEvent {
  final String msg;
  AuthMsgErr(this.msg);
}

class AuthLogin extends AuthEvent {
  String login;
  String pass;

  AuthLogin({
    required this.login,
    required this.pass,
  });
}
