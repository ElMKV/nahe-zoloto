part of 'qr_code_bloc.dart';

@immutable
abstract class QrCodeEvent {}

class QrScanEvent extends QrCodeEvent {
  String? code;
  QrScanEvent(this.code);
}

class QrScanStopEvent extends QrCodeEvent {
  QrScanStopEvent();
}
