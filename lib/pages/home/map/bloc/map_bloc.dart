import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nashe_zoloto/core/strings.dart';
import 'package:nashe_zoloto/data/model/mapModel/mapModel.dart';
import 'package:nashe_zoloto/domain/repositories/map.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

part 'map_event.dart';

part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(MapInitial(PageState())) {
    on<GetAddressEvent>((event, emit) async {
      List<PlacemarkMapObject> pointMap = [];
      emit(MapLoading(state.pageState));
      final MapRepository mapRepository = MapRepository();
      await mapRepository.getAddress().then((value) {
        if (value != null) {
          for (var element in value) {
            for (var element in element.stores) {
              double lat = double.parse(element.lat);
              double long = double.parse(element.long);

              pointMap.add(PlacemarkMapObject(
                  mapId: MapObjectId('placemark_$lat'),
                  point: Point(latitude: lat, longitude: long),
                  icon: PlacemarkIcon.single(PlacemarkIconStyle(
                      image: BitmapDescriptor.fromAssetImage(
                          'assets/point.png')))));
            }
          }
          emit(MapUp(
              state.pageState.copyWith(mapModel: value, pointMap: pointMap)));
        } else {
          emit(MapError(state.pageState.copyWith(
            onAwait: false,
            errMsg: S.map_error,
          )));
        }
      });
    });
    on<MapChangeTab>((event, emit) {
      emit(MapUp(state.pageState.copyWith(
        mapView: event.isMap
      )));

    });
  }
}
