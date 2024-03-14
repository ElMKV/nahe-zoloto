part of 'detail_bloc.dart';

@immutable
abstract class DetailEvent {}




class DetailonChangePage extends DetailEvent {
  final int current;
  DetailonChangePage(this.current);
}