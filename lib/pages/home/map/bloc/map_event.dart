part of 'map_bloc.dart';

@immutable
abstract class MapEvent {}


class HomeChangePage extends MapEvent {
  int page;
  HomeChangePage(this.page);
}


class GetAddressEvent extends MapEvent {
  GetAddressEvent();
}
class MapChangeTab extends MapEvent {
  bool isMap;
  MapChangeTab(this.isMap);
}
