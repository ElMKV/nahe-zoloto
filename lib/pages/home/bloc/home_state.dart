part of 'home_bloc.dart';

@immutable
abstract class HomeState {
  final PageState pageState;
  const HomeState(this.pageState);
}

class HomeInitial extends HomeState {
  const HomeInitial(PageState pageState) : super(pageState);
}
class HomeLoading extends HomeState {
  const HomeLoading(PageState pageState) : super(pageState);
}

class HomeUp extends HomeState {
  const HomeUp(PageState pageState) : super(pageState);
}

class HomeNav extends HomeState {
  const HomeNav(PageState pageState) : super(pageState);
}

class HomeError extends HomeState {
  const HomeError(PageState pageState) : super(pageState);
}


class PageState {
  bool onAwait;
  String errMsg;
  Object? args;
  final PageController currentPage = PageController(initialPage: 0);


  PageState({
    this.onAwait = false,
    this.errMsg = '',
    this.args,

  });

  PageState copyWith({
    bool? onAwait,
    String? errMsg,
    Object? args,
    PageController? currentPage,

  }) {
    return PageState(
      onAwait: onAwait ?? this.onAwait,
      errMsg: errMsg ?? this.errMsg,
      args: args ?? this.args,

    );
  }
}
