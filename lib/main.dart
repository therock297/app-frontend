import 'package:flutter/material.dart';
import 'package:qr_code_app/scan.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'borading',
        home: _ElevatedButtonExample(),
        theme: ThemeData(
          fontFamily: 'Poppins',
          primaryColor: Color.fromARGB(255, 0, 0, 0),
        ));
  }
}

class _ElevatedButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Color(0xFF380E4A)),
      backgroundColor: Color(0xFF380E4A),
      body: SafeArea(
        child: Column(
          children: [
            Align(
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
            new Align(
              alignment: FractionalOffset.topRight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ScanQrPage()));
                },
                child: Text(
                  'Scanner',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(70, 40),
                  primary: Color(0xFFEF8B60),
                  onPrimary: Colors.black,
                  shape: RoundedRectangleBorder(
                      //to set border radius to button
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 308, 8, 0),
                child: Container(
                  width: 300,
                  height: 100,
                  child: Text(
                      'Blob of text which will contain instructions for the user on how to complete the workout and what to expect'),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Start'),
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(180, 40),
                    primary: Color(0xFFEF8B60),
                    onPrimary: Colors.black,
                    shape: RoundedRectangleBorder(
                        //to set border radius to button
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
