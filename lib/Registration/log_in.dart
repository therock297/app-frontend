// ignore_for_file: avoid_print

import 'dart:convert';

//import 'dart:ffi';
//import 'dart:js_util';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:redback_mobile_app/Utils/constants.dart' as constants;
import 'package:redback_mobile_app/Utils/shared_prefs_util.dart';
import 'package:redback_mobile_app/Registration/sign_up.dart';

import 'package:sign_button/sign_button.dart';

import '../Home/select_workout.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // our form key
  final _formKey = GlobalKey<FormState>();
  final userNameEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();

  late TextFormField userNameField;
  late TextFormField passwordField;

  void toastShow(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blueGrey,
        textColor: Colors.white,
        fontSize: 16.0);
  }
  bool _isHidden = true;
  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
  Future<bool> getData() async {
    // allow bypass in debug with limited functionality
    if (kDebugMode) {
      return true;
    }

    // ensure the fields aren't empty
    if (userNameEditingController.text.isEmpty ||
        passwordEditingController.text.isEmpty) {
      toastShow("Please enter all fields");
      return false;
    }

    try {
      var client = http.Client();
      // use 127.0.0.1 when testing with a browser and 10.0.2.2 when testing with the emulator
      String uri = '${constants.server}/login';
      var response = await client.post(Uri.parse(uri),
          headers: {"Content-Type": "application/json; charset=utf-8"},
          body: jsonEncode({
            "username": userNameEditingController.text,
            "password": passwordEditingController.text,
          }));

      //If the information is correct, you will be redirected to the home page
      //If there is an error message, there will be an alert box to indicate
      // that the account number or password is incorrect
      if (response.statusCode == 200) {
        var values = json.decode(response.body);
        //save accessToken and refreshToken in sharedPreferences memory
        SharedPrefsUtil.setTokens(values);
        var accessToken = values["accessToken"];
        var username = userNameEditingController.text;
        // Obtain and save user details after verified login for future pages
        response = await client.get(
          Uri.parse('${constants.server}/user/$username'),
          headers: {
            "Content-Type": "application/json; charset=utf-8",
            "Authorization": "Bearer $accessToken"
          },
        );
        if (response.statusCode == 200) {
          var userValues = json.decode(response.body);
          SharedPrefsUtil.setUserDetails(userValues);
          debugPrint("Successfully logged in");
        }
        return true;
      } else {
        //The style also needs to be set
        toastShow(response.body);
      }
      client.close();
    } catch (e) {
      print(e);
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    // username field
    userNameField = TextFormField(
        autofocus: false,
        controller: userNameEditingController,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          fillColor: const Color(0xffffffff),
          filled: true,
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ));

    //password field
    passwordField = TextFormField(
        autofocus: false,
        controller: passwordEditingController,
        obscureText: true,
        textInputAction: TextInputAction.next,
        style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        decoration: InputDecoration(
          fillColor: const Color(0xffffffff),
          filled: true,
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          suffix: InkWell(
            onTap: _togglePasswordView,  /// This is Magical Function
            child: Icon(
              _isHidden ?         /// CHeck Show & Hide.
              Icons.visibility :
              Icons.visibility_off,
            ),
          ),
        ));

    //login button
    final logInButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: const Color(0xFFe87461),
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () async => {

              FirebaseAuth.instance
                  .signInWithEmailAndPassword(
                  email: userNameEditingController.text,
                  password: passwordEditingController.text)
                  .then((value) {
          Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const SelectWorkout()));
              }).onError((error, stackTrace) {
                print("Error ${error.toString()}");
              }),

              },
          child: const Text(
            "Log In",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          )),
    );

    return Scaffold(

      body: Center(
        child: SingleChildScrollView(
          child: Container(
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
              ),
            ),
            /*color: const Color.fromRGBO(56, 14, 74, 1),*/
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    //Image.asset('assets/images/Logo.png'),
                    SizedBox(
                        height: 180,
                        //image logo
                        child: Image.asset(
                          'assets/images/BLogo.png',
                          fit: BoxFit.contain,
                        )),
                    const SizedBox(height: 45),
                    userNameField,
                    const SizedBox(height: 20),
                    passwordField,
                    const SizedBox(height: 20),
                    logInButton,
                    // const SizedBox(height: 15),
                    const SizedBox(height: 13),
                    // TextButton(
                    //   style: TextButton.styleFrom(
                    //     textStyle: const TextStyle(
                    //         fontSize: 12, color: Color(0xFFe87461)),
                    //   ),
                    //   onPressed: () {},
                    //   child: const Text(
                    //     "Forgot Password ?",
                    //     style: TextStyle(
                    //         color: Colors.white,
                    //         fontWeight: FontWeight.bold,
                    //         fontSize: 15),
                    //   ),
                    // ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            "Don't have an Account? ",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegistrationScreen()));
                            },
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: /*Color(0xFFe87461)*/ Color(0xFFE87461),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                        ]),
                    const SizedBox(height: 50,),
                    Column(
                      //This aligns the buttons in the middle of the column.
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //Sign in button

                        //Adds some space between the buttons. We use width because this is a row.

                        //Create Account button
                        Container(
                          width: 320.0, // Set the width of the container
                          height: 50.0, // Set the height of the container
                          child: SignInButton(
                            buttonType: ButtonType.google,
                            onPressed: () {
                              print('click');
                            },
                          ),
                        ),
                        const SizedBox(height: 20,),

                        Container(
                          width: 320.0, // Set the width of the container
                          height: 50.0, // Set the height of the container
                          child: SignInButton(
                            buttonType: ButtonType.github,
                            onPressed: () {
                              print('click');
                            },
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Container(
                          width: 320.0, // Set the width of the container
                          height: 50.0, // Set the height of the container
                          child: SignInButton(
                            buttonType: ButtonType.facebook,
                            onPressed: () {
                              print('click');
                            },
                          ),
                        ),
                        const SizedBox(height: 20,),


                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signUp(String text, String text2) {}
}
