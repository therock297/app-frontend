import 'package:flutter/material.dart';
import 'package:redback_mobile_app/Registration/log_in.dart';
import 'package:redback_mobile_app/Registration/sign_up.dart';
import 'package:sign_button/sign_button.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WelcomePage(title: 'Redback Operations'),
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

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: DecoratedBox(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0xFFE87461),
            Color.fromARGB(255, 99, 37, 126),
            //Color.fromARGB(255, 239, 136, 120),
            Color(0xff380E4A),
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
            const SizedBox(
              height: 50,
            ),
            //Slogan text that appears under logo.
            const Text('WALK AND GET',
                style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold, color: Color(0xFFE87461))),
            //Creates some spacing between texts. We use height because this is a column.
            const SizedBox(
              height: 10,
            ),
            const Text('REWARDED',
                style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold, color: Color(0xFFE87461))),
            const SizedBox(
              height: 10,
            ),
            //Agreement text for user. Text.rich is used so that we can use TextSpan rather
            //using simple text. This allows us to break the text into parts and apply
            //different styling to them.
            const Text.rich(TextSpan(
              text: 'Earn SSG coins for every setup you take',
              style: TextStyle(fontSize: 15, color: Color(0xFFE87461)),
              //Adding specifically underlined text.

            )),
            const SizedBox(height: 60,),
            //Adding a row of buttons within the column.
            Column(
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
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30), // <-- Radius
                        ),
                        foregroundColor: Colors.white,
                        minimumSize: const Size(320, 50),
                        backgroundColor: const Color.fromRGBO(232, 116, 97, 1)),
                    child: const Text('Sign In')),
                const SizedBox(height: 30,),
                //Adds some space between the buttons. We use width because this is a row.

              ],
            ),
            Row(
              //This aligns the buttons in the middle of the column.
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Sign in button

                //Adds some space between the buttons. We use width because this is a row.

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
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30), // <-- Radius
                        ),
                        foregroundColor: Colors.white,
                        minimumSize: const Size(320, 50),
                        backgroundColor: const Color.fromARGB(255, 163, 76, 207),),
                    child: const Text('Create Account')),
                const SizedBox(height: 50,),


              ],
            ),
            Column(
              //This aligns the buttons in the middle of the column.
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Sign in button
                const SizedBox(height: 30,),
                const Text('OR WITH',
                    style: TextStyle(fontSize: 15, color: Color(0xFFE87461))),

                const SizedBox(height: 30,),
                //Adds some space between the buttons. We use width because this is a row.

              ],
            ),
            Row(
              //This aligns the buttons in the middle of the column.
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Sign in button

                //Adds some space between the buttons. We use width because this is a row.

                //Create Account button
                SignInButton.mini(
                  buttonType: ButtonType.google,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                              const RegistrationScreen()));
                    },),

                SignInButton.mini(
                  buttonType: ButtonType.github,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                            const RegistrationScreen()));
                  },),
                SignInButton.mini(
                  buttonType: ButtonType.facebook,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                            const RegistrationScreen()));
                  },),
                const SizedBox(height: 50,),


              ],
            ),
          ],

        ),
      ),
    );
  }
}
