import 'package:flutter/material.dart';

class NotificationPreferenceScreen extends StatefulWidget {
  @override
  State<NotificationPreferenceScreen> createState() =>
      _NotificationPreferenceScreenState();
}

class _NotificationPreferenceScreenState
    extends State<NotificationPreferenceScreen> {
  bool isNewEnabled = false;
  bool isPromotionEnabled = false;

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
                    'NOTIFICATIONS PREFERENCE',
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
                          "Promotion",
                          style: TextStyle(color: Colors.white),
                        ),
                        Switch(
                          value: isPromotionEnabled,
                          onChanged: (value) {
                            setState(() {
                              isPromotionEnabled = value;
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
                          "News",
                          style: TextStyle(color: Colors.white),
                        ),
                        Switch(
                          value: isNewEnabled,
                          onChanged: (value) {
                            setState(() {
                              isNewEnabled = value;
                              // Add your logic for toggling dark mode here
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // headings....
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Teams",
                          style: TextStyle(color: Colors.white),
                        ),
                        Row(
                          children: [
                            Text(
                              "Matches",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "News",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FavTeamList(),
                    FavTeamList(),
                    FavTeamList(),
                    FavTeamList(),
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

class FavTeamList extends StatelessWidget {
  const FavTeamList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      color: Color.fromARGB(255, 40, 40, 40),
      child: Column(
        children: [
          // ListTile(
          //   leading: CircleAvatar(
          //     backgroundImage: AssetImage(
          //         'assets/images/champion.png'), // Replace with your image path
          //   ),
          //   title: Text(
          //     'FC BACELONA',
          //     style: TextStyle(
          //       color: Color(0xff9B8BFF),
          //     ),
          //   ),
          //   trailing: Row(
          //     mainAxisSize: MainAxisSize.min,
          //     children: [
          //       Icon(
          //         Icons.notifications,
          //         color: Color(0xff9B8BFF),
          //       ),
          //       SizedBox(
          //         width: 5,
          //       ),
          //       Icon(
          //         Icons.notifications,
          //         color: Color(0xff9B8BFF),
          //       ),
          //     ],
          //   ),
          // ),
          Container(
            height: 60,
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 4,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(
                            'assets/images/fcb.png'), // Replace with your image path
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'FC BARCELONA',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Icon(
                        Icons.notifications,
                        color: Color(0xff9B8BFF),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.notifications,
                        color: Color(0xff9B8BFF),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
