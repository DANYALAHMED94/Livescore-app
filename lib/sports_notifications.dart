import 'package:flutter/material.dart';

class SportsNotificationScreen extends StatefulWidget {
  @override
  State<SportsNotificationScreen> createState() =>
      _SportsNotificationScreenState();
}

class _SportsNotificationScreenState extends State<SportsNotificationScreen> {
  bool isAllEnabled = false;
  bool isGoalEnabled = false;
  bool isBookingEnabled = false;
  bool isCornersEnabled = false;
  bool isMatchStartEnabled = false;
  bool isMatchEndEnabled = false;
  bool isLineUpEnabled = false;
  bool isSubsitutionEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'NOTIFICATIONS',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.close, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "All",
                          style: TextStyle(color: Colors.white),
                        ),
                        Switch(
                          value: isGoalEnabled,
                          onChanged: (value) {
                            setState(() {
                              isGoalEnabled = value;
                              // Add your logic for toggling dark mode here
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Goals",
                          style: TextStyle(color: Colors.white),
                        ),
                        Switch(
                          value: isAllEnabled,
                          onChanged: (value) {
                            setState(() {
                              isAllEnabled = value;
                              // Add your logic for toggling dark mode here
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Booking",
                          style: TextStyle(color: Colors.white),
                        ),
                        Switch(
                          value: isBookingEnabled,
                          onChanged: (value) {
                            setState(() {
                              isBookingEnabled = value;
                              // Add your logic for toggling dark mode here
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Corners",
                          style: TextStyle(color: Colors.white),
                        ),
                        Switch(
                          value: isCornersEnabled,
                          onChanged: (value) {
                            setState(() {
                              isCornersEnabled = value;
                              // Add your logic for toggling dark mode here
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Match Start",
                          style: TextStyle(color: Colors.white),
                        ),
                        Switch(
                          value: isMatchStartEnabled,
                          onChanged: (value) {
                            setState(() {
                              isMatchStartEnabled = value;
                              // Add your logic for toggling dark mode here
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Match End",
                          style: TextStyle(color: Colors.white),
                        ),
                        Switch(
                          value: isMatchEndEnabled,
                          onChanged: (value) {
                            setState(() {
                              isMatchEndEnabled = value;
                              // Add your logic for toggling dark mode here
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Line Up",
                          style: TextStyle(color: Colors.white),
                        ),
                        Switch(
                          value: isLineUpEnabled,
                          onChanged: (value) {
                            setState(() {
                              isLineUpEnabled = value;
                              // Add your logic for toggling dark mode here
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Subsitution",
                          style: TextStyle(color: Colors.white),
                        ),
                        Switch(
                          value: isSubsitutionEnabled,
                          onChanged: (value) {
                            setState(() {
                              isSubsitutionEnabled = value;
                              // Add your logic for toggling dark mode here
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 0.5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Terms and conditions | Blazescore 2024',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Version - 1.01',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
