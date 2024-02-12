import 'dart:async';

import 'package:flutter/material.dart';

import 'favourite_team_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      // After 3 seconds, navigate to the main screen.
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => FavouriteTeamScreen()),
      );
    });
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
              child: RichText(
                text: const TextSpan(
                    style: TextStyle(fontFamily: "lucky", fontSize: 38,),
                    children: [
                      TextSpan(
                          text: "BLAZE",
                          style: TextStyle(color: Color(0xff9B8BFF))
                      ),
                      TextSpan(
                          text: "SCORE"
                      )
                    ]
                ),
              ),
            ),
            Positioned(
              top: -mediaQuery.size.height*0.2,
              left: -mediaQuery.size.width*0.5,
              child: CircleAvatar(
                radius: mediaQuery.size.width*0.45,
                backgroundColor: const Color(0xff131313),
              ),
            )
          ],
        ),
      )
    );
  }
}