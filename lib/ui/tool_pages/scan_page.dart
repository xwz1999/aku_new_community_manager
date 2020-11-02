import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanPage extends StatefulWidget {
  ScanPage({Key key}) : super(key: key);

  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController _qrViewController;

  @override
  void dispose() {
    _qrViewController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          QRView(
            key: qrKey,
            onQRViewCreated: (controller) {
              _qrViewController = controller;
              controller.scannedDataStream.listen((event) {
                BotToast.showText(text: event);
              });
            },
          ),
          Center(
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.red,
                  width: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
