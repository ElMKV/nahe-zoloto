import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nashe_zoloto/data/model/auth.dart';


part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial(PageState())) {
    on<AuthInit>(authInit);
    on<AuthMsgErr>(authMsgErr);
    on<AuthAcceptPass>(authAcceptPass);

    add(AuthInit());
  }

  authInit(AuthInit event, emit) async {
    emit(AuthUp(state.pageState));
  }


  authAcceptPass(AuthAcceptPass event, emit) async {
    bool accept = false;
    if (event.val.length >= 6) {
      accept = true;
    }
    emit(AuthUp(state.pageState.copyWith(
      validatePass: accept,
    )));
  }


  authMsgErr(AuthMsgErr event, emit) async {
    emit(AuthError(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(AuthMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
