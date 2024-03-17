import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nashe_zoloto/core/strings.dart';
import 'package:nashe_zoloto/data/model/mapModel/mapModel.dart';
import 'package:nashe_zoloto/domain/repositories/map.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(MapInitial(PageState())) {
    on<GetAddressEvent>((event, emit) async {
      emit(MapLoading(state.pageState));
      final MapRepository mapRepository = MapRepository();
      await mapRepository.getAddress().then((value) {
        value?.forEach((element) {
          print(element.stores.first.address);
        });
        if (value != null) {
          emit(MapUp(state.pageState
              .copyWith(mapModel: value)));
        } else {
          emit(MapError(state.pageState.copyWith(
            onAwait: false,
            errMsg: S.map_error,
          )));
        }
      });
    });

  }
}
