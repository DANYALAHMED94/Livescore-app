import 'package:flutter/material.dart';

import '../BottomNavigationScreens/NewsScreens/NewsScreen.dart';
import 'Favourite/TennisFavouriteScreens.dart';
import 'TennisDashboard/TennisDashBoard.dart';

class MainTennisScreen extends StatefulWidget {
  MainTennisScreen({super.key});

  @override
  State<MainTennisScreen> createState() => _MainTennisScreenState();
}

class _MainTennisScreenState extends State<MainTennisScreen> {

  int selectedScreen = 0;

  @override
  Widget build(BuildContext context) {

    List<Widget> tennisBottomNavigationScreens = [
      const TennisDashBoardScreen(),
      TennisFavouriteScreen(isBack: false),
      NewsScreen(),
    ];

    return Scaffold(
      backgroundColor: const Color(0xff161616),
      body: tennisBottomNavigationScreens[selectedScreen],
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width*0.1
        ),
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.sports_tennis,), label: "Matches"),
            BottomNavigationBarItem(icon: Icon(Icons.star_border_outlined,), label: "Favourite"),
            BottomNavigationBarItem(icon: Icon(Icons.newspaper_outlined,), label: "News"),
          ],
          currentIndex: selectedScreen,
          onTap: (newValue){
            setState(() {
              selectedScreen = newValue;
            });
          },
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: const Color(0xff9B8BFF),
          unselectedItemColor: Colors.grey,
          backgroundColor: const Color(0xff161616),
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

}
