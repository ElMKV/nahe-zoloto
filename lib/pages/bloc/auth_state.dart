// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

abstract class AuthState {
  final PageState pageState;
  const AuthState(this.pageState);
}

class AuthInitial extends AuthState {
  const AuthInitial(PageState pageState) : super(pageState);
}

class AuthLoading extends AuthState {
  const AuthLoading(PageState pageState) : super(pageState);
}

class AuthUp extends AuthState {
  const AuthUp(PageState pageState) : super(pageState);
}

class AuthNav extends AuthState {
  const AuthNav(PageState pageState) : super(pageState);
}

class AuthError extends AuthState {
  const AuthError(PageState pageState) : super(pageState);
}

class PageState {
  bool onAwait;
  String errMsg;
  Auth auth;
  Object? args;
  bool validateLogin;
  bool validatePass;
  bool obscurePass;
  bool get loginEnable => validateLogin && validatePass;

  PageState({
    this.onAwait = false,
    this.errMsg = '',
    this.auth = const Auth(),
    this.args,
    this.validateLogin = false,
    this.validatePass = false,
    this.obscurePass = true,
  });

  PageState copyWith({
    bool? onAwait,
    String? errMsg,
    Auth? auth,
    Object? args,
    bool? acceptRules,
    bool? validateLogin,
    bool? validatePass,
    bool? obscurePass,
  }) {
    return PageState(
      onAwait: onAwait ?? this.onAwait,
      errMsg: errMsg ?? this.errMsg,
      auth: auth ?? this.auth,
      args: args ?? this.args,
      validateLogin: validateLogin ?? this.validateLogin,
      validatePass: validatePass ?? this.validatePass,
      obscurePass: obscurePass ?? this.obscurePass,
    );
  }
}
