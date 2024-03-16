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
  bool goToDetail;
  String errMsg;
  Object? args;
  BarcodeModel barcodeModel;
  Profile profile;
  final PageController currentPage = PageController(initialPage: 0);
  int intCurrentPage;


  PageState({
    this.onAwait = false,
    this.goToDetail = false,
    this.errMsg = '',
    this.args,
    this.barcodeModel= const BarcodeModel(),
    this.intCurrentPage = 0,
    this.profile = const Profile(),

  });

  PageState copyWith({
    bool? onAwait,
    bool? goToDetail,
    String? errMsg,
    Object? args,
    BarcodeModel? barcodeModel,
    Profile? profile,
    int? intCurrentPage,
    PageController? currentPage,

  }) {
    return PageState(
      onAwait: onAwait ?? this.onAwait,
      goToDetail: goToDetail ?? this.goToDetail,
      errMsg: errMsg ?? this.errMsg,
      args: args ?? this.args,
      barcodeModel: barcodeModel ?? this.barcodeModel,
      intCurrentPage: intCurrentPage ?? this.intCurrentPage,
      profile: profile ?? this.profile,
    );
  }
}
