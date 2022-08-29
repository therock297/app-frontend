import 'package:flutter/material.dart';

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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        child: Container(
                          child: Text(
                            'Well Done John!',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFFEF8B60),
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                        child: Container(
                          child: Text(
                            'Here is how your workout went',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFFEF8B60),
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Workout Length ',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color.fromARGB(255, 151, 166, 185),
                                      fontSize: 25,
                                    ),
                                  ),
                                  Text(
                                    '00:00:05',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFFEF8B60),
                                      fontSize: 25,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 40, 0, 0),
                                    child: Text(
                                      'Max Level ',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color:
                                            Color.fromARGB(255, 151, 166, 185),
                                        fontSize: 25,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Sustained ',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color.fromARGB(255, 151, 166, 185),
                                      fontSize: 25,
                                    ),
                                  ),
                                  Text(
                                    'Level 7',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFFEF8B60),
                                      fontSize: 25,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 40, 0, 0),
                                    child: Text(
                                      'Max Heart',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color:
                                            Color.fromARGB(255, 151, 166, 185),
                                        fontSize: 25,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Rate ',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color.fromARGB(255, 151, 166, 185),
                                      fontSize: 25,
                                    ),
                                  ),
                                  Text(
                                    '140 BPM',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFFEF8B60),
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Max Speed ',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color.fromARGB(255, 151, 166, 185),
                                      fontSize: 25,
                                    ),
                                  ),
                                  Text(
                                    '32.0 KM/H',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFFEF8B60),
                                      fontSize: 25,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 40, 0, 0),
                                    child: Text(
                                      'Max Cadence ',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color:
                                            Color.fromARGB(255, 151, 166, 185),
                                        fontSize: 25,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    ' ',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color.fromARGB(255, 151, 166, 185),
                                      fontSize: 25,
                                    ),
                                  ),
                                  Text(
                                    '60RPM',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFFEF8B60),
                                      fontSize: 25,
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 40, 0, 0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Max Power',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                color: Color.fromARGB(
                                                    255, 151, 166, 185),
                                                fontSize: 25,
                                              ),
                                            ),
                                            Text(
                                              'Output ',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                color: Color.fromARGB(
                                                    255, 151, 166, 185),
                                                fontSize: 25,
                                              ),
                                            ),
                                          ])),
                                  Text(
                                    '15.0 KJ',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFFEF8B60),
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                    ]),
              ),
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                  child: ElevatedButton(
                    onPressed: () {
                      print('Pressed');
                    },
                    child: Text('Home'),
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
            ]),
      ),
    );
  }
}
