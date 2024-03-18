part of 'map_bloc.dart';

@immutable
abstract class MapState {
  final PageState pageState;
  const MapState(this.pageState);
}

class MapInitial extends MapState {
  const MapInitial(PageState pageState) : super(pageState);

}

class MapLoading extends MapState {
  const MapLoading(PageState pageState) : super(pageState);
}

class MapUp extends MapState {
  const MapUp(PageState pageState) : super(pageState);
}

class MapNav extends MapState {
  const MapNav(PageState pageState) : super(pageState);
}

class MapError extends MapState {
  const MapError(PageState pageState) : super(pageState);
}


class PageState {
  bool onAwait;
  bool mapView;
  bool viewSalonDetail;
  String errMsg;
  Object? args;
  List<MapModel> mapModel;
  MapModel currentMapModel;
  List<PlacemarkMapObject> pointMap;



  PageState({
    this.onAwait = false,
    this.mapView = true,
    this.viewSalonDetail = false,
    this.errMsg = '',
    this.args,
    this.currentMapModel = const MapModel(),
    this.mapModel = const [],
    this.pointMap = const [],


  });

  PageState copyWith({
    bool? onAwait,
    bool? mapView,
    bool? viewSalonDetail,
    String? errMsg,
    Object? args,
    MapModel? currentMapModel,
    List<MapModel>? mapModel,
    List<PlacemarkMapObject>? pointMap


  }) {
    return PageState(
      onAwait: onAwait ?? this.onAwait,
      mapView: mapView ?? this.mapView,
      viewSalonDetail: viewSalonDetail ?? this.viewSalonDetail,
      currentMapModel: currentMapModel ?? this.currentMapModel,
      errMsg: errMsg ?? this.errMsg,
      args: args ?? this.args,
      mapModel: mapModel ?? this.mapModel,
      pointMap: pointMap ?? this.pointMap,
    );
  }
}
