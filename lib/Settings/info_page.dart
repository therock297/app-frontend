import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

//This is a mockup list data for demonstration purpose only.
//Please use back-end code like node js to call the actual one from RedBack operation database.
List newsList = [
  {"news": 'Industry Guest Lecture from Daniel Yong, Midnyte City Monday 12pm-1pm', "time": 15},
  {"news": 'Leadership Conference is being held tomorrow Saturday 30th April from 2-3:30pm', "time": 42},
  {"news": 'Cohort Contribution: Become a Faculty of SEBE Peer Mentor.', "time": 60},
  {"news": 'Placeholder', "time": 90},
  {"news": 'Some more news', "time": 1440},
];

class InformationPage extends StatelessWidget {
  const InformationPage({Key? key}) : super(key: key);

  Widget getNewsData(context, index) {
    return Container(
      padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      width: double.infinity,
      height: 250,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 5,
          backgroundColor: const Color.fromARGB(255, 232, 116, 97),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0)
          )
        ),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const InformationPage()));
        },
        child: RichText(
          text: TextSpan(
            text: "Redback News\n",
            style: const TextStyle(
              color: Colors.purple,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
            children: [
              TextSpan(
                text: newsList[index]["news"],
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                ),
              )
            ]
          )
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(102, 232, 116, 97),
        elevation: 0,
        centerTitle: true,
        title: const Text('RedBack Information'),
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(102, 232, 116, 97),
              Color.fromARGB(255, 56, 14, 74),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              padding: const EdgeInsets.all(5.0),
              scrollDirection: Axis.vertical,
              itemCount: newsList.length,
              itemBuilder: getNewsData
              )
            ),
          ),
        ),
      );
    //   bottomNavigationBar: Container(
    //     color: const Color.fromARGB(255, 230, 152, 129),
    //     child: const Padding(
    //       padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
    //       child: GNav(
    //           backgroundColor: Color.fromARGB(255, 230, 152, 129),
    //           color: Color.fromARGB(183, 255, 255, 255),
    //           activeColor: Color.fromARGB(255, 130, 235, 182),
    //           tabBackgroundColor: Color.fromARGB(55, 114, 243, 153),
    //           gap: 10,
    //           padding: EdgeInsets.all(16),
    //           tabs: [
    //             GButton(
    //               icon: Icons.home,
    //               text: 'Home',
    //             ),
    //             GButton(
    //               icon: Icons.favorite_rounded,
    //               text: 'Friends',
    //             ),
    //             GButton(
    //               icon: Icons.account_circle_rounded,
    //               text: 'Profile',
    //             ),
    //           ]),
    //     ),
    //   ),
    // );
  }
}