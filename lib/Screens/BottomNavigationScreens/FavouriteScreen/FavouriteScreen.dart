import 'package:flutter/material.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';
import 'BasketBallFavorites/BasketBallMatches.dart';
import 'BasketBallFavorites/BasketBallTeams.dart';
import 'FootballFavoriteBody/FootballMatches.dart';
import 'FootballFavoriteBody/Teams/FootballTeams.dart';

class FavouriteScreen extends StatefulWidget {
  String selectedFavourite;
  bool isBackEnabled;

  FavouriteScreen({super.key, required this.selectedFavourite,required this.isBackEnabled});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {

  int selectedTab = 0;

  List<String> tabMenuList = [
    "Matches",
    "Teams",
  ];

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    List<Widget> tabScreensList = [
      widget.selectedFavourite=="Football"?FootballMatches():BasketBallMatches(),
      widget.selectedFavourite=="Football"?FootballTeams():BasketBallTeams()
    ];

    return Scaffold(
        backgroundColor: const Color(0xff000000),
        appBar: AppBar(
          surfaceTintColor: Colors.black,
          backgroundColor: Colors.black,
          title: const Text("FAVOURITE",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          automaticallyImplyLeading: widget.isBackEnabled,
        ),
        body: SwipeDetector(
          onSwipeLeft: (offset) {
            setState(() {
              selectedTab = 1;
            });
          },
          onSwipeRight: (offset) {
            setState(() {
              selectedTab = 0;
            });
          },
          behavior: HitTestBehavior.opaque,
          child: SizedBox(
            height: mediaQuery.size.height,
            width: mediaQuery.size.width,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: mediaQuery.size.height*0.08
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: tabScreensList[selectedTab])
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.black,
                  width: mediaQuery.size.width,
                  height: mediaQuery.size.height*0.07,
                  child: ListView.builder(itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedTab = index;
                        });
                        },
                      child: Container(
                          padding: const EdgeInsets.only(
                            top: 23,
                            left: 20,
                            right: 20
                        ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(tabMenuList[index],
                                style: TextStyle(
                                  fontWeight: selectedTab == index? FontWeight.w900: FontWeight.w600,
                                  fontSize: selectedTab == index? 14: 12,
                                  color: selectedTab == index?const Color(0xff9B8BFF):Colors.white,
                                ),
                              ),
                              selectedTab==index?Container(
                                height: 3,
                                width: mediaQuery.size.width*0.2,
                                color: const Color(0xff9B8BFF),
                              ):
                              const SizedBox()
                            ],
                          )
                      ),
                    );
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: tabMenuList.length,
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
