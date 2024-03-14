part of 'qr_code_bloc.dart';

@immutable
abstract class QrCodeState {
  final PageState pageState;
  const QrCodeState(this.pageState);
}




class QrCodeInitial extends QrCodeState {
  const QrCodeInitial(PageState pageState) : super(pageState);
}


class QrCodeUp extends QrCodeState {
  const QrCodeUp(PageState pageState) : super(pageState);
}



class PageState {
  bool onAwait;
  String errMsg;
  Object? args;
  bool enables;


  PageState({
    this.onAwait = false,
    this.errMsg = '',
    this.args,
    this.enables = false,


  });

  PageState copyWith({
    bool? enables,
    bool? onAwait,
    String? errMsg,
    Object? args,


  }) {
    return PageState(
      onAwait: onAwait ?? this.onAwait,
      errMsg: errMsg ?? this.errMsg,
      args: args ?? this.args,
      enables: enables ?? this.enables,
    );
  }
}
