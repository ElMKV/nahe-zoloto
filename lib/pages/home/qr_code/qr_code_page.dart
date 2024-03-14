import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nashe_zoloto/core/strings.dart';
import 'package:nashe_zoloto/pages/home/qr_code/bloc/qr_code_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../futures/core_widgets/custom_button.dart';

class QRCodePage extends StatefulWidget {
  @override
  _QRCodePageState createState() => _QRCodePageState();
}

class _QRCodePageState extends State<QRCodePage> {
  late QRViewController _controller;
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QrCodeBloc(),
      child: BlocConsumer<QrCodeBloc, QrCodeState>(
        listener: (context, state) {
          if(state.pageState.enables){
            print('stop camera');
            _controller.pauseCamera();
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(S.qr_code_adv, textAlign: TextAlign.center,),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: QRView(
                    key: _qrKey,
                    onQRViewCreated: (controller) {
                      _controller = controller;
                      _controller.scannedDataStream.listen((scanData) {
                        print('Scanned data: ${scanData.code}');
                        context.read<QrCodeBloc>().add(
                            QrScanEvent(scanData.code));
                      });
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                      child: CustomButton(
                        text: S.go, enable: state.pageState.enables, width: 300,)
                  ),
                ),

              ],
            ),
          );
        },
      ),
    );
  }
}