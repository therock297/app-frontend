// make sure to import these packages
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:io';

class ScanQrPage extends StatefulWidget {
  const ScanQrPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ScanQrPage();
}

class _ScanQrPage extends State<ScanQrPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // Variables needed for the QR Scanning
  Barcode? result;
  int state = 0;
  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            // This creates the small window where the user
            // can view the QR code being scanned
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Machine Example'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 200,
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
            child: Text("${result!.code}!",
                style: const TextStyle(fontSize: 24),
                textAlign: TextAlign.center),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            //Scanning resumes when the user closes the pop-up box
            controller!.resumeCamera();
            //Set the delay to three seconds, otherwise the window
            // will keep popping up because the code does not stop
            Future.delayed(const Duration(milliseconds: 3000), () {
              state = 0;
            });
          },
          child: const Text('Close'),
        ),
      ],
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        if (state == 0) {
          showDialog(
            context: context,
            builder: (BuildContext context) => _buildPopupDialog(context),
          );
          //Automatically pauses scanning when a box pops up
          controller.pauseCamera();
        }
        state = 1;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
