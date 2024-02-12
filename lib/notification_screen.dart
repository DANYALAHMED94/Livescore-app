import 'package:flutter/material.dart';
import 'package:live_score_app/sports_notifications.dart';

import 'notification_preference.dart';

class NotificationScreen extends StatefulWidget {
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool isDarkModeEnabled = false;

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
                          "Notification Preference",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        NotificationPreferenceScreen()));
                          },
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
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
                          "Alerts",
                          style: TextStyle(color: Colors.white),
                        ),
                        Switch(
                          value: isDarkModeEnabled,
                          onChanged: (value) {
                            setState(() {
                              isDarkModeEnabled = value;
                              // Add your logic for toggling dark mode here
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SportListTile(
                      sportName: 'Football',
                      sportIcon: Icons.sports_soccer,
                      onTap: () {
                        _selectSport('Football');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SportsNotificationScreen()));
                      },
                    ),
                    SportListTile(
                      sportName: 'Basketball',
                      sportIcon: Icons.sports_basketball,
                      onTap: () {
                        _selectSport('Basketball');
                      },
                    ),
                    SportListTile(
                      sportName: 'Tennis',
                      sportIcon: Icons.sports_tennis,
                      onTap: () {
                        _selectSport('Tennis');
                      },
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

  String selectedSport = 'Football';

  void _selectSport(String sport) {
    setState(() {
      selectedSport = sport;
    });
  }
}

class SportListTile extends StatelessWidget {
  final String sportName;
  final IconData sportIcon;

  final VoidCallback onTap;

  SportListTile({
    required this.sportName,
    required this.sportIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Row(
        children: [
          Row(
            children: [
              Icon(
                sportIcon,
                color: Colors.white,
              ),
              SizedBox(width: 10),
              Text(
                sportName,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Colors.white,
      ),
      onTap: onTap,
    );
  }
}
