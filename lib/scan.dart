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
          Expanded(
            flex: 1,
            child: Center(
              child: (result != null)
                  // Upon scanning the QR code data will be
                  //  printed in a text box below
                  ? Text('QR Code Data: ${result!.code}')
                  : const Text('Scan a code'),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text('Popup example'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 200,
            padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
            child: Text("This is the context of how to uese !",
                style: TextStyle(fontSize: 24), textAlign: TextAlign.center),
          ),
        ],
      ),
      actions: <Widget>[
        new TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            //Set the delay to three seconds, otherwise the window
            // will keep popping up because the code does not stop
            Future.delayed(Duration(milliseconds: 3000), () {
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
          state = 1;
        }
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
