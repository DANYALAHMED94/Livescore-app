import 'package:flutter/material.dart';
import 'package:live_score_app/Screens/remove_ads_screen.dart';
import '../notification_screen.dart';
import '../select_default_screen.dart';
import 'contactUs_screen.dart';
import 'help_Center_screen.dart';
import 'login_screen.dart';

class SettingScreen extends StatefulWidget {
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  // final _searchHelpController = TextEditingController();
  // final _formKey = GlobalKey<FormState>();
  // bool _isLoading = false;
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
                    'SETTING',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: const Icon(Icons.close, color: Colors.white),)
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // account
                    Row(
                      children: [
                        Text(
                          'Account',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                    Divider(),
                    // login listLile...........
                    ListTile(
                      leading: Icon(
                        Icons.person_2_outlined,
                        color: Colors.white,
                      ),
                      title: Text(
                        "No account",
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xff9B8BFF)),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          child: Text(
                            "Log In",
                            style: TextStyle(color: Colors.black),
                          )),
                    ),
                    // remove ads.....
                    ListTile(
                      leading: Icon(
                        Icons.ads_click_rounded,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Remove Ads",
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RemoveAdsScreen()));
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    // help and support...
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HelpCenterScreen()));
                      },
                      child: ListTile(
                        leading: Icon(
                          Icons.help,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Help and Support",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    // contact us....
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ContactUsScreen()));
                      },
                      child: ListTile(
                        leading: Icon(
                          Icons.contact_page_rounded,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Contact Us",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),

                    // preference...

                    Row(
                      children: [
                        Text(
                          'Preferance',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                    Divider(),

                    // default sport.....
                    ListTile(
                      title: Text(
                        "Default sport",
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SelectDefaultSportScreen()));
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    // notification setting.....
                    ListTile(
                      title: Text(
                        "Notification setting",
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NotificationScreen()));
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    // theme...

                    Row(
                      children: [
                        Text(
                          'Theme',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                    Divider(),

                    // theme.....
                    ListTile(
                      title: Text(
                        "Dark Mode",
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Switch(
                        value: isDarkModeEnabled,
                        onChanged: (value) {
                          setState(() {
                            isDarkModeEnabled = value;
                            // Add your logic for toggling dark mode here
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
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
