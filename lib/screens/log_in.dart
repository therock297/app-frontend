// ignore_for_file: avoid_print

import 'dart:convert';

//import 'dart:ffi';
//import 'dart:js_util';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:redback_mobile_app/Utils/constants.dart' as constants;
import 'package:redback_mobile_app/screens/home_page.dart';
import 'package:redback_mobile_app/screens/sign_up.dart';
import 'package:redback_mobile_app/select_workout.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Obtain shared preferences.
late SharedPreferences prefs;

getSharedPreferences() async {
  prefs = await SharedPreferences.getInstance();
}

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

  Future<bool> getData() async {
    if (userNameEditingController.text.isEmpty ||
        passwordEditingController.text.isEmpty) {
      toastShow("Please enter all fields");
      return false;
    }

    getSharedPreferences();
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
      print("test1");
      //If the information is correct, you will be redirected to the home page
      //If there is an error message, there will be an alert box to indicate
      // that the account number or password is incorrect
      if (response.statusCode == 200) {
        var values = json.decode(response.body);
        //save accessToken and refreshToken in sharedPreferences memory
        prefs.setString("accessToken", values["accessToken"]);
        prefs.setString("refreshToken", values["refreshToken"]);
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
          prefs.setString("_id", userValues["_id"]);
          prefs.setString("username", userValues["username"]);
          prefs.setString("firstname", userValues["firstname"]);
          prefs.setString("lastname", userValues["lastname"]);
          prefs.setString("email", userValues["email"]);
          prefs.setString("password", userValues["password"]);
          prefs.setInt("redbackCoins", userValues["redbackCoins"]);
          prefs.setInt("telephone", userValues["telephone"]);
          prefs.setInt("userLevel", userValues["userLevel"]);
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
          fillColor: const Color(0xFFe87461),
          filled: true,
          prefixIcon: const Icon(Icons.account_circle),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "User Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
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
          fillColor: const Color(0xFFe87461),
          filled: true,
          prefixIcon: const Icon(Icons.vpn_key),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
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
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SelectWorkout()));
          } /*async => {
                if (await getData())
                  {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HomePage()))
                  }
              }*/
          ,
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
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(56, 14, 74, 1),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFe87461)),
          onPressed: () {
            //passing this to our root
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
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
                    const SizedBox(height: 15),
                    const SizedBox(height: 13),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(
                            fontSize: 12, color: Color(0xFFe87461)),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Forgot Password ?",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
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
                                  color: /*Color(0xFFe87461)*/ Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          )
                        ])
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
