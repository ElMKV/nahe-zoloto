import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nashe_zoloto/core/strings.dart';
import 'package:nashe_zoloto/core/utils.dart';
import 'package:nashe_zoloto/data/model/auth/auth.dart';
import 'package:nashe_zoloto/domain/repositories/auth.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial(PageState())) {
    on<AuthLogin>((event, emit) async {
      emit(AuthLoading(state.pageState));
      final AuthRepository authRepository = AuthRepository();
      await authRepository.getAuth(event.login, event.pass).then((value) {
        if (value?.token != null) {
          SaveLoginData(value?.token);

          emit(AuthNav(state.pageState.copyWith(
              onAwait: false, errMsg: S.auth_error, isLogined: true)));
        } else {
          emit(AuthError(state.pageState.copyWith(
            onAwait: false,
            errMsg: S.auth_error,
          )));
        }
      });
    });
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(AuthMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
