// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:bot_toast/bot_toast.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

// Project imports:
import 'package:aku_community_manager/tools/screen_tool.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_back_button.dart';

// import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanPage extends StatefulWidget {
  ScanPage({Key key}) : super(key: key);

  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  String tempText;
  Timer _timer;
  bool _barMove = false;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      if (mounted)
        setState(() {
          _barMove = !_barMove;
        });
    });
  }

  @override
  void dispose() {
    // _qrViewController?.dispose();
    _timer?.cancel();
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
              controller.scannedDataStream.listen((event) {
                if (tempText != event.code) {
                  tempText = event.code;
                  BotToast.showText(text: event.code);
                }
              });
            },
          ),
          Center(
            child: Stack(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.red,
                      width: 1,
                    ),
                  ),
                ),
                AnimatedPositioned(
                  top: _barMove ? 10 : 190,
                  child: Container(
                    width: 200,
                    height: 2,
                    color: Colors.red,
                  ),
                  curve: Curves.easeInOutCubic,
                  duration: Duration(milliseconds: 300),
                ),
              ],
            ),
          ),
          Positioned(
            left: 10,
            top: 10 + statusBarHeight,
            child: Material(
              color: Colors.black45,
              borderRadius: BorderRadius.circular(40),
              child: AkuBackButton.close(brightness: Brightness.dark),
            ),
          ),
        ],
      ),
    );
  }
}
