import 'package:flutter/material.dart';
import 'package:redback_mobile_app/screens/log_in.dart';
import 'package:redback_mobile_app/screens/sign_up.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          //scaffoldBackgroundColor changes the colour of the background of the app.
          scaffoldBackgroundColor: /*const Color.fromRGBO(56, 14, 74, 1)*/ null,
          primarySwatch: null),
      home: const WelcomePage(title: 'Redback Operations'),
    );
  }
}

//WelcomePage is made Stateful.
class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

//setState can be used here inside of another method which does something.
class _WelcomePageState extends State<WelcomePage> {
  //example method using setState to increment a counter
  /*void _incrementCounter() {
    setState(() {});
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Change colour of AppBar to match colour scheme.
        backgroundColor: const Color.fromRGBO(232, 116, 97, 1),
        //Added padding because we want another widget in the AppBar
        //which is the company logo.
        leading: Padding(
            padding: const EdgeInsets.all(0.0),
            //Loaded and added image logo from assets folder.
            child: Image.asset(
              'assets/images/BLogo.png',
            )),
        title: Text(widget.title),
      ),
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
          children: <Widget>[
            //Loaded the logo from assets folder and places it at the top of the screen.
            Image.asset(
              'assets/images/BLogo.png',
              height: 300,
              width: 300,
            ),
            //Slogan text that appears under logo.
            const Text('EXERCISE AND GET REWARDED',
                style: TextStyle(fontSize: 20, color: Colors.white)),
            //Creates some spacing between texts. We use height because this is a column.
            const SizedBox(
              height: 10,
            ),
            //Agreement text for user. Text.rich is used so that we can use TextSpan rather
            //using simple text. This allows us to break the text into parts and apply
            //different styling to them.
            const Text.rich(TextSpan(
              text: 'By continuing, you agree to our ',
              style: TextStyle(fontSize: 10, color: Colors.white),
              //Adding specifically underlined text.
              children: <TextSpan>[
                TextSpan(
                    text: 'Terms & Conditions',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    )),
                TextSpan(
                    text: ' & Privacy Policy',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    )),
              ],
            )),
            const SizedBox(height: 5),
            //Adding a row of buttons within the column.
            Row(
              //This aligns the buttons in the middle of the column.
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Sign in button
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()));
                    },
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        minimumSize: const Size(120, 40),
                        backgroundColor: const Color.fromRGBO(232, 116, 97, 1)),
                    child: const Text('Sign In')),
                //Adds some space between the buttons. We use width because this is a row.
                const SizedBox(
                  width: 20,
                ),
                //Create Account button
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const RegistrationScreen()));
                    },
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        minimumSize: const Size(120, 40),
                        backgroundColor: const Color.fromRGBO(232, 116, 97, 1)),
                    child: const Text('Create Account')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
