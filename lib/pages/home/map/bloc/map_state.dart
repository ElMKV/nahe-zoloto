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
  bool goToDetail;
  String errMsg;
  Object? args;
  List<MapModel> mapModel;



  PageState({
    this.onAwait = false,
    this.goToDetail = false,
    this.errMsg = '',
    this.args,
    this.mapModel = const [],


  });

  PageState copyWith({
    bool? onAwait,
    bool? goToDetail,
    String? errMsg,
    Object? args,
    List<MapModel>? mapModel


  }) {
    return PageState(
      onAwait: onAwait ?? this.onAwait,
      goToDetail: goToDetail ?? this.goToDetail,
      errMsg: errMsg ?? this.errMsg,
      args: args ?? this.args,
      mapModel: mapModel ?? this.mapModel,
    );
  }
}
