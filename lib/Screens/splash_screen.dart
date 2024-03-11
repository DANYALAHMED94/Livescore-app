import 'dart:async';
import 'package:flutter/material.dart';
import 'package:live_score_app/Screens/BottomNavigationScreens/MainScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'favourite_team_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () => _checkFirstTime(context),);
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: const Color(0xff101010),
      body: SizedBox(
        height: mediaQuery.size.height,
        width: mediaQuery.size.width,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(70.0),
                child: Image.asset("assets/images/splash.png"),
              ),
            ),
            Positioned(
              top: -mediaQuery.size.height*0.2,
              left: -mediaQuery.size.width*0.5,
              child: CircleAvatar(
                radius: mediaQuery.size.width*0.45,
                backgroundColor: const Color(0xff131313),
              ),
            ),
          ],
        ),
      )
    );
  }

  _checkFirstTime(BuildContext context) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

    if (isFirstTime) {
      // Show the pop-up
      print('This is the First User');
      prefs.setBool('isFirstTime', false);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FavouriteTeamScreen(),
          )
      );
      
    }
    else {
      print('This is the Old User');
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                MainScreen(
                    gameChoice: "Football"),
          )
      );
    }
  }
}

