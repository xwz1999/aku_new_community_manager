import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScannerPage extends StatefulWidget {
  QrScannerPage({Key key}) : super(key: key);

  @override
  _QrScannerPageState createState() => _QrScannerPageState();
}

class _QrScannerPageState extends State<QrScannerPage> {
  GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController _qrViewController;
  Barcode result;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _qrViewController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      body: QRView(
          key: _qrKey,
          overlay: QrScannerOverlayShape(
            borderColor: kPrimaryColor,
          ),
          onQRViewCreated: (QRViewController viewController) {
            _qrViewController = viewController;
            viewController.scannedDataStream.listen((event) {
              setState(() {
                result = event;
              });
            });
          }),
    );
  }
}
