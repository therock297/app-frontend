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
              alignment: FractionalOffset.topRight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ScanQrPage()));
                },
                child: const Text(
                  'Scanner',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(70, 40),
                  primary: const Color(0xFFEF8B60),
                  onPrimary: Colors.black,
                  shape: RoundedRectangleBorder(
                      //to set border radius to button
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0, 0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(1, 1, 1, 0),
                child: Container(
                  width: 300,
                  height: 100,
                  child: const Text(
                      'Welcome to the Ramped Fitness Test, In this workout your aim is to cycle for as long as possible, you will begin at a nice cruising pace.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFFEF8B60),
                          )),
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0, 0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(1, 2, 1, 0),
                child: Container(
                  width: 300,
                  height: 100,
                  child: const Text(
                      'Every 30 seconds the difficulty will increase, making it harder to continue to cycle. This is a test of both your strength and endurance so make sure to pace yourself to have the best possible chance of clearing all the difficulties. ',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFFEF8B60),
                      )),
                  ),
                ),
              ),
            Align(
              alignment: const AlignmentDirectional(0, 0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(1, 3, 1, 0),
                child: Container(
                  width: 300,
                  height: 100,
                  child: const Text(
                      'Once you reach your limit, press the ‘Finish Workout’ button towards the bottom of the screen to end the workout and view your results. Good Luck! ',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFFEF8B60),
                      )),
                  ),
                ),
              ),
            Align(
              alignment: const AlignmentDirectional(0, 0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Start'),
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(180, 40),
                    primary: const Color(0xFFEF8B60),
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
