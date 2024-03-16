part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeChangePage extends HomeEvent {
  int page;
  HomeChangePage(this.page);
}
class HomeGoToDetail extends HomeEvent {
  BarcodeModel barcode;
  HomeGoToDetail(this.barcode);
}

class GetProfileEvent extends HomeEvent {
  GetProfileEvent();
}
