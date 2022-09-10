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
          // This creates the small window where the user
          // can view the QR code being scanned
          Expanded(
            flex: 5,
            child: _buildQRView(context),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  //passing this to our root
                  Navigator.of(context).pop();
                },
                child: const Text("Back to Onboarding Screen"),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('QR Code Information'),
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

  Widget _buildQRView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 250.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 20,
          borderWidth: 5,
          cutOutSize: scanArea),
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
