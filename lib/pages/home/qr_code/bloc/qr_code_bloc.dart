import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nashe_zoloto/data/model/barcode/barcode.dart';
import 'package:nashe_zoloto/domain/repositories/barcode.dart';

part 'qr_code_event.dart';

part 'qr_code_state.dart';

class QrCodeBloc extends Bloc<QrCodeEvent, QrCodeState> {
  QrCodeBloc() : super(QrCodeInitial(PageState())) {

    on<QrScanEvent>((event, emit) async {

      print(event.code);
      if (event.code != null && event.code!.isNotEmpty) {
        final BarcodeRepository barcodeRepository = BarcodeRepository();
        await barcodeRepository.getBarcode(event.code!).then((value) {
          if(value?.code.isNotEmpty ?? false){
            emit(QrCodeUp(state.pageState.copyWith(enables: true, barcodeModel: value)));

          }

        });
      }

    });

    on<QrScanNavEvent>((event, emit) async {
      emit(QrCodeNav(state.pageState.copyWith(
          onAwait: false)));
    });
  }
}
