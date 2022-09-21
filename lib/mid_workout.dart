import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:redback_mobile_app/Utils/shared_prefs_util.dart';
import 'package:redback_mobile_app/end_screen.dart';

class MidWorkout extends StatelessWidget {
  const MidWorkout({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int level = 1;

  late int downTime = 5;

  late int timingNumber = 0;

  late Timer dTimer;

  late String timeElapsed = "00:00:00";

  @override
  void initState() {
    super.initState();

    dTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (downTime > 0) {
        setState(() {
          downTime--;
        });
      } else {
        if (timingNumber >= 0) {
          setState(() {
            timingNumber++;
          });
        } else {
          debugPrint("Work Finished! ${formatTimeString(timingNumber)}");
          dTimer.cancel();
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    dTimer.cancel();
  }

  String formatTimeString(int value) {
    String minute = (value / 60).floor() >= 10
        ? "${(value / 60).floor()}"
        : "0${(value / 60).floor()}";
    String second = value % 60 >= 10 ? "${value % 60}" : "0${value % 60}";
    return "00:$minute:$second";
  }

  finishWorkout() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const EndScreen()));
    debugPrint("Work Finished! ${formatTimeString(timingNumber)}");
    dTimer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(181, 79, 92, 1),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(78, 34, 84, 1),
        foregroundColor: Colors.white,
        title: const Text(
          "Ramped Workout",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 27,
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: SizedBox(
                                width: 150,
                                height: 70,
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        color: Colors.white,
                                        alignment: Alignment.center,
                                        child: const Text(
                                          "Speed",
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        color: const Color.fromRGBO(
                                            239, 93, 62, 1),
                                        alignment: Alignment.center,
                                        child: const Text(
                                          "15.0 KM/H",
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: SizedBox(
                                width: 150,
                                height: 70,
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        color: Colors.white,
                                        alignment: Alignment.center,
                                        child: const Text(
                                          "Cadence",
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        color: const Color.fromRGBO(
                                            239, 93, 62, 1),
                                        alignment: Alignment.center,
                                        child: const Text(
                                          "60 RPM",
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: SizedBox(
                                width: 150,
                                height: 70,
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        color: Colors.white,
                                        alignment: Alignment.center,
                                        child: const Text(
                                          "Heart Rate",
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        color: const Color.fromRGBO(
                                            239, 93, 62, 1),
                                        alignment: Alignment.center,
                                        child: const Text(
                                          "140 BPM",
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: SizedBox(
                                width: 150,
                                height: 70,
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        color: Colors.white,
                                        alignment: Alignment.center,
                                        child: const Text(
                                          "Oxygen\nSaturation",
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        color: const Color.fromRGBO(
                                            239, 93, 62, 1),
                                        alignment: Alignment.center,
                                        child: const Text(
                                          "96%",
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        "Time Elapsed",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        formatTimeString(timingNumber),
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: SizedBox(
                                width: 150,
                                height: 70,
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        color: Colors.white,
                                        alignment: Alignment.center,
                                        child: const Text(
                                          "Watts",
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        color: const Color.fromRGBO(
                                            239, 93, 62, 1),
                                        alignment: Alignment.center,
                                        child: const Text(
                                          "15.0 KJ",
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: SizedBox(
                                width: 150,
                                height: 70,
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        color: Colors.white,
                                        alignment: Alignment.center,
                                        child: const Text(
                                          "Current Level",
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        color: const Color.fromRGBO(
                                            239, 93, 62, 1),
                                        alignment: Alignment.center,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Visibility(
                                              // @formatter:off
                                                visible: SharedPrefsUtil.getWorkoutType() != "ramped",
                                                // @formatter:on
                                                maintainSize: true,
                                                maintainAnimation: true,
                                                maintainState: true,
                                                child: InkWell(
                                                  onTap: () {
                                                    if (level > 1) {
                                                      level -= 1;
                                                      setState(() {});
                                                    }
                                                  },
                                                  child: Container(
                                                    width: 24,
                                                    height: 24,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          const Color.fromRGBO(
                                                              255, 255, 255, 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24),
                                                    ),
                                                    child: const Text("-"),
                                                  ),
                                                )),
                                            Text(
                                              "$level",
                                              style: const TextStyle(
                                                fontSize: 13,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Visibility(
                                              // @formatter:off
                                              visible: SharedPrefsUtil.getWorkoutType() != "ramped",
                                              // @formatter:on
                                              maintainSize: true,
                                              maintainAnimation: true,
                                              maintainState: true,
                                              child: InkWell(
                                                onTap: () {
                                                  if (level < 20) {
                                                    level += 1;
                                                    setState(() {});
                                                  }
                                                },
                                                child: Container(
                                                  width: 24,
                                                  height: 24,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    color: const Color.fromRGBO(
                                                        255, 255, 255, 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24),
                                                  ),
                                                  child: const Text("+"),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 70,
                alignment: Alignment.center,
                color: const Color.fromRGBO(78, 34, 84, 1),
                child: InkWell(
                  onTap: () => finishWorkout(),
                  child: Container(
                    width: 150,
                    height: 45,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(239, 93, 62, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      "Finish Workout",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Offstage(
            offstage: downTime <= 0,
            child: Container(
              width: 500,
              height: 1000,
              alignment: Alignment.center,
              color: const Color.fromRGBO(0, 0, 0, 0.4),
              child: Container(
                width: 120,
                height: 120,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 230, 152, 129),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  "$downTime",
                  style: const TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 230, 152, 129),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: GNav(
              backgroundColor: Color.fromARGB(255, 230, 152, 129),
              color: Color.fromARGB(183, 255, 255, 255),
              activeColor: Color.fromARGB(255, 130, 235, 182),
              tabBackgroundColor: Color.fromARGB(55, 114, 243, 153),
              gap: 10,
              padding: EdgeInsets.all(16),
              tabs: [
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
