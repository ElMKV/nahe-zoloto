import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:nashe_zoloto/core/strings.dart';
import 'package:nashe_zoloto/data/model/profile/profile.dart';
import 'package:nashe_zoloto/domain/repositories/auth.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial(PageState())) {
    on<GetProfileEvent>((event, emit) async {
      emit(HomeLoading(state.pageState));
      final AuthRepository authRepository = AuthRepository();
      await authRepository.getProfile().then((value) {
        if (value != null) {
          emit(HomeUp(state.pageState
              .copyWith(profile: value)));
        } else {
          emit(HomeError(state.pageState.copyWith(
            onAwait: false,
            errMsg: S.profile_error,
          )));
        }
      });

      on<HomeChangePage>((event, emit) {
        PageController pageController = state.pageState.currentPage;
        pageController.jumpToPage(event.page);
        emit(HomeUp(state.pageState
            .copyWith(onAwait: false, currentPage: pageController, intCurrentPage: event.page)));
      });
    });
  }}
