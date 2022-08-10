import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:redback_mobile_app/Account.dart';
import 'package:redback_mobile_app/screens/info_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 104, 75, 182),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 104, 75, 182),
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
    );
  }
}
