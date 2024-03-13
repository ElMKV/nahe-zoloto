part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeChangePage extends HomeEvent {
  int page;
  HomeChangePage(this.page);
}
