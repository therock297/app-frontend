import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:redback_mobile_app/Account.dart';
import 'package:redback_mobile_app/info_page.dart';

//This is a mockup list data for demonstration purpose only.
//Please use back-end code like node js to call the actual one from RedBack operation database.
List listData = [
  {
    "title": 'Ramped Workout',
  },
  {
    "title": 'Workout 2',
  },
  {
    "title": 'Workout 3',
  },
  {
    "title": 'Workout 4',
  },
  {
    "title": 'Workout 5',
  },
  {
    "title": 'Workout 6',
  },
];

class SelectWorkout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SelectWorkoutState();
}

//Use flutter builder to create a list of buttons by using data from listData
class HomeContent extends StatelessWidget {
  Widget _getListData(context, index) {
    return new Container(
      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      width: 110,
      height: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 5,
          primary: Color(0xFFE87461),
          padding: const EdgeInsets.all(0.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: () {
          //Navigator.push(context, MaterialPageRoute(builder: (context) => OnBoarding()));
        },
        child: Text(
          listData[index]["title"],
          style: TextStyle(color: Color.fromRGBO(64, 32, 27, 1)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // List constructor
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.18,
      decoration: BoxDecoration(
        color: Color(0x1AFFFFFF),
      ),
      child: ListView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          // List item length
          itemCount: listData.length,
          // create list based on mockup data
          itemBuilder: this._getListData), //Call HomeContent
    );
  }
}

class SelectWorkoutState extends State<SelectWorkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 104, 75, 182),
      appBar: AppBar(
        backgroundColor: Color(0xFF38014A),
        elevation: 0,
        centerTitle: true,
        title: Text('R E D B A C K'),
      ),
      drawer: Drawer(
        child: Container(
          color: Color.fromARGB(255, 230, 152, 129),
          child: ListView(
            children: [
              DrawerHeader(
                  child: Center(
                child: Text(
                  'REDBACK',
                  style: TextStyle(fontSize: 30),
                ),
              )),
              ListTile(
                leading: Icon(Icons.account_circle_rounded),
                title: Text(
                  'Profile',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  // Here we will navigate to the accounts page
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Account(),
                  ));
                },
              ),
              ListTile(
                leading: Icon(Icons.history_edu_rounded),
                title: Text(
                  'Fitness History',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  // Here we will navigate to the accounts page
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => InformationPage(),
                  ));
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text(
                  'Settings',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  // Here we will navigate to the accounts page
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Account(),
                  ));
                },
              ),
              ListTile(
                leading: Icon(Icons.report_gmailerrorred),
                title: Text(
                  'Report an Issue',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  // Here we will navigate to the accounts page
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Account(),
                  ));
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Color.fromARGB(255, 230, 152, 129),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: GNav(
              backgroundColor: Color.fromARGB(255, 230, 152, 129),
              color: Color.fromARGB(183, 255, 255, 255),
              activeColor: Color.fromARGB(255, 130, 235, 182),
              tabBackgroundColor: Color.fromARGB(55, 114, 243, 153),
              gap: 10,
              padding: EdgeInsets.all(16),
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.favorite_rounded,
                  text: 'Friends',
                ),
                GButton(
                  icon: Icons.account_circle_rounded,
                  text: 'Profile',
                ),
              ]),
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              color: Color(0xFF38014A),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
              child: SingleChildScrollView(
                  child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-0.9, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 80, 0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          color: Color(0x00FFFFFF),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Text(
                            'New Workout',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFE87461),
                            ),
                            textDirection: TextDirection.ltr,
                            softWrap: true,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 90),
                    child: HomeContent(),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.9, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.05,
                      decoration: BoxDecoration(
                        color: Color(0x00FFFFFF),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Text(
                          'Previous Workout',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFE87461),
                          ),
                          textDirection: TextDirection.ltr,
                          softWrap: true,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 100),
                    child: HomeContent(),
                  ),
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }
}
