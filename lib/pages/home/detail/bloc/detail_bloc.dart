import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(DetailInitial(PageState())) {
    on<DetailonChangePage>((event, emit) {
      emit(DetailUp(state.pageState.copyWith(
        current: event.current
      )));
    });
  }
}
