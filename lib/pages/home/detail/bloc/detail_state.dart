part of 'detail_bloc.dart';

@immutable
abstract class DetailState {
  final PageState pageState;
  const DetailState(this.pageState);
}

class DetailInitial extends DetailState {
  const DetailInitial(PageState pageState) : super(pageState);

}

class DetailUp extends DetailState {
  const DetailUp(PageState pageState) : super(pageState);
}


class PageState {
  bool onAwait;
  String errMsg;
  int current;


  PageState({
    this.onAwait = false,
    this.errMsg = '',
    this.current = 0,

  });

  PageState copyWith({
    bool? onAwait,
    String? errMsg,
    int? current,

  }) {
    return PageState(
      onAwait: onAwait ?? this.onAwait,
      errMsg: errMsg ?? this.errMsg,
      current: current ?? this.current,
    );
  }
}
