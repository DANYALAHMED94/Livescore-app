import 'package:flutter/material.dart';
import 'DashBoards/BasketBallDashboard.dart';
import 'DashBoards/FootBallDashboard.dart';
import 'FavouriteScreen/FavouriteScreen.dart';
import 'NewsScreens/NewsScreen.dart';
import 'Stats/BasketBallStats.dart';
import 'Stats/FootballStats/FootballStats.dart';

class MainScreen extends StatefulWidget {
  String gameChoice;
  MainScreen({super.key, required this.gameChoice});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  
  int selectedScreen = 0;
  
  @override
  Widget build(BuildContext context) {

    List<Widget> bottomNavigationScreens = [
      widget.gameChoice.contains("F")
          ?FootBallDashBoardScreen()
          :BasketBallDashBoardScreen(),
      widget.gameChoice.contains("F")
          ?FavouriteScreen(selectedFavourite: "Football", isBackEnabled: false)
          :FavouriteScreen(selectedFavourite: "Basketball", isBackEnabled: false),
      NewsScreen(),
      widget.gameChoice.contains("F")
          ?FootBallStats()
          :BasketBallStats()
    ];

    return Scaffold(
      backgroundColor: const Color(0xff161616),
      body: bottomNavigationScreens[selectedScreen],
      bottomNavigationBar: BottomNavigationBar(
          items: [
            widget.gameChoice.contains("F")?const BottomNavigationBarItem(icon: Icon(Icons.sports_soccer,), label: "Matches")
                :const BottomNavigationBarItem(icon: Icon(Icons.sports_basketball_rounded,), label: "Matches"),
            const BottomNavigationBarItem(icon: Icon(Icons.star_border_outlined,), label: "Favourite"),
            const BottomNavigationBarItem(icon: Icon(Icons.newspaper_outlined,), label: "News"),
            const BottomNavigationBarItem(icon: Icon(Icons.settings_input_antenna,), label: "Stats")
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
    );
  }

}
