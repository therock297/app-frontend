import 'package:flutter/material.dart';
import 'package:qr_code_app/scan.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Boarding Screen',
        home: _ElevatedButtonExample(),
        theme: ThemeData(
          fontFamily: 'Poppins',
          primaryColor: const Color.fromARGB(255, 0, 0, 0),
        ));
  }
}

class _ElevatedButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            // ignore: prefer_const_constructors
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: const Color(0xFF380E4A)),
      backgroundColor: const Color(0xFF380E4A),
      body: SafeArea(
        child: Column(
          children: [
            const Align(
              alignment: AlignmentDirectional(0, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 28, 8, 0),
                child: Text(
                  'Ramped Workout',
                  style: TextStyle(
                    fontSize: 25,
                    color: Color(0xFFEF8B60),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              // Icon button with the QR Icon for the QR Scanner
              child: Padding(
                // Padding to ensure that icon button is not on the edge of the screen
                padding: const EdgeInsets.fromLTRB(0, 0, 30.0, 0),
                // Adding a file background to make the icon stand out
                child: Ink(
                  decoration: const ShapeDecoration(
                      color: Color(0xFFEF8B60), shape: CircleBorder()),
                  child: IconButton(
                    icon: const Icon(Icons.qr_code_2),
                    tooltip: "QR Code Scanner",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ScanQrPage()));
                    },
                    iconSize: 50,
                  ),
                ),
              ),
            ),
            const Align(
              alignment: AlignmentDirectional(0, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 308, 8, 0),
                child: SizedBox(
                  width: 300,
                  height: 100,
                  child: Text(
                      'Blob of text which will contain instructions for the user on how to complete the workout and what to expect'),
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0, 0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: const Color(0xFFEF8B60),
                    fixedSize: const Size(180, 40),
                    shape: RoundedRectangleBorder(
                        //to set border radius to button
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('Start'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
