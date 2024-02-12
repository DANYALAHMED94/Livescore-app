import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../TennisBottomNavigationBar/MainTennisScreen.dart';
import 'MainScreen.dart';

class MatchesMenusSelector extends StatefulWidget {
  const MatchesMenusSelector({super.key});

  @override
  State<MatchesMenusSelector> createState() => _MatchesMenusSelectorState();
}

class _MatchesMenusSelectorState extends State<MatchesMenusSelector> {

  String selectedSport = 'Football';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getSelectedSports();
  }

  int action = 0;

  List<String> sportsItems = [
    "Football",
    "Basketball",
    "Tennis",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff101010),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 32),

            SizedBox(
              height: 55,
              // width: mediaQuery.size.width,
              child: TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: 'Select Sports',
                    // fillColor: const Color(0xff212121),
                    fillColor: Colors.transparent,
                    filled: true,
                    hintStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w200
                    ),
                    prefixIcon: IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close,color: Colors.white,),),
                    suffixIcon: const Icon(Icons.search,color: Colors.white,),
                    border: InputBorder.none
                ),
              ),
            ),

            const SizedBox(height: 12),
            SportListTile(
              sportName: sportsItems[0],
              sportIcon: Icons.sports_soccer,
              isSelected: 0 == action,
              onTap: () async{
                final SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setInt('SelectedSport', 0);
                _selectSport(sportsItems[0]);
              },
            ),
            SportListTile(
              sportName: sportsItems[1],
              sportIcon: Icons.sports_basketball,
              isSelected: 1 == action,
              onTap: () async{
                final SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setInt('SelectedSport', 1);
                _selectSport(sportsItems[1]);
              },
            ),
            SportListTile(
              sportName: sportsItems[2],
              sportIcon: Icons.sports_tennis,
              isSelected: 2 == action,
              onTap: () async{
                final SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setInt('SelectedSport', 2);
                _selectSport(sportsItems[2]);
              },
            ),
          ],
        ),
      ),
    );
  }

  void getSelectedSports() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var getNameSports = prefs.getInt("SelectedSport");

    setState(() {
      action = getNameSports ?? 0;
    });

    // if(action!.contains("F")){
    //   sportsItems.replaceRange(0, 3, ["Football", "Basketball", "Tennis",]);
    //
    // }
    // else if(action!.contains("T")){
    //   sportsItems.replaceRange(0, 3, ["Tennis","Basketball","Football"]);
    // }
    // else{
    //   sportsItems.replaceRange(0, 3, ["Basketball","Tennis","Football"]);
    // }

    setState(() {
    });

  }

  void _selectSport(String sport) {
    setState(() {
      selectedSport = sport;
    });

    if(selectedSport.contains("T")) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) =>
              MainTennisScreen(),));
    }
    else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) =>
              MainScreen(gameChoice: selectedSport,),));
    }
  }
}


class SportListTile extends StatelessWidget {
  final String sportName;
  final IconData sportIcon;
  final bool isSelected;
  final VoidCallback onTap;

  SportListTile({
    required this.sportName,
    required this.sportIcon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      title: Row(
        children: [
          Container(
            width: 4,
            height: 24,
            decoration: BoxDecoration(
              color: isSelected ? Color(0xff9B8BFF) : Colors.transparent,
            ),
            margin: EdgeInsets.only(right: 10),
          ),
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
      trailing: const Icon(
        Icons.notifications,
        color: Color(0xff9B8BFF),
      ),
      onTap: onTap,
    );
  }

}

