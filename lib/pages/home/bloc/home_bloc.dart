import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial(PageState())) {

    on<HomeChangePage>((event, emit) {
      PageController pageController = state.pageState.currentPage;
      pageController.jumpToPage(event.page);
      emit(HomeUp(state.pageState.copyWith(
          onAwait: false,
          currentPage: pageController
      )));
    });
  }
}
