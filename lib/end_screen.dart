import 'package:flutter/material.dart';
import 'package:redback_mobile_app/screens/home_page.dart';

class EndScreen extends StatelessWidget {
  const EndScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'boarding',
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
      // Removing the app bar for the sake of design. It may be added later if needed.
      // appBar: AppBar(
      //     leading: new IconButton(
      //       icon: new Icon(Icons.arrow_back, color: Colors.black),
      //       onPressed: () => Navigator.of(context).pop(),
      //     ),
      //     backgroundColor: Color(0xFF380E4A)),
      backgroundColor: /*const Color(0xFF380E4A)*/ null,

      body: DecoratedBox(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0xff380E4A),
            Color.fromARGB(255, 99, 37, 126),
            //Color.fromARGB(255, 239, 136, 120),
            Color(0xFFE87461),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        child: Text(
                          'Well Done John!',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            color: /*Color(0xFFEF8B60)*/ Colors.white,
                            fontSize: 30,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                        child: Text(
                          'Here is how your workout went',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: /*Color(0xFFEF8B60)*/ Colors.white,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 40, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: const [
                                  Text(
                                    'Workout Length ',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: /*Color.fromARGB(255, 151, 166, 185)*/ Colors
                                          .white,
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
                                            /*Color.fromARGB(255, 151, 166, 185)*/ Colors
                                                .white,
                                        fontSize: 25,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Sustained ',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: /*Color.fromARGB(255, 151, 166, 185)*/ Colors
                                          .white,
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
                                            /*Color.fromARGB(255, 151, 166, 185)*/ Colors
                                                .white,
                                        fontSize: 25,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Rate ',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: /*Color.fromARGB(255, 151, 166, 185)*/ Colors
                                          .white,
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
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 40, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  const Text(
                                    'Max Speed ',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: /*Color.fromARGB(255, 151, 166, 185)*/ Colors
                                          .white,
                                      fontSize: 25,
                                    ),
                                  ),
                                  const Text(
                                    '32.0 KM/H',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFFEF8B60),
                                      fontSize: 25,
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 40, 0, 0),
                                    child: Text(
                                      'Max Cadence ',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color:
                                            /*Color.fromARGB(255, 151, 166, 185)*/ Colors
                                                .white,
                                        fontSize: 25,
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    ' ',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color.fromARGB(255, 151, 166, 185),
                                      fontSize: 25,
                                    ),
                                  ),
                                  const Text(
                                    '60RPM',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFFEF8B60),
                                      fontSize: 25,
                                    ),
                                  ),
                                  Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 40, 0, 0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'Max Power',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                color: /*Color.fromARGB(255, 151, 166, 185)*/ Colors
                                                    .white,
                                                fontSize: 25,
                                              ),
                                            ),
                                            Text(
                                              'Output ',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                color: /*Color.fromARGB(255, 151, 166, 185)*/ Colors
                                                    .white,
                                                fontSize: 25,
                                              ),
                                            ),
                                          ])),
                                  const Text(
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
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                  child: ElevatedButton(
                    onPressed: () {
                      // It will take us back to homepage.dart
                      debugPrint('Pressed');
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: const Color(0xFFEF8B60),
                      fixedSize: const Size(180, 40),
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text('Home'),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
