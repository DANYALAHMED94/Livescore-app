import 'package:flutter/material.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';
import 'package:live_score_app/Screens/BottomNavigationScreens/DashBoards/BasketBallTeamInfo/BaskelballTeaminfoSubScreens/B_Standing.dart';
import 'package:live_score_app/Screens/BottomNavigationScreens/DashBoards/BasketBallTeamInfo/BaskelballTeaminfoSubScreens/BasketballMatches/BasketballFixtures.dart';
import 'package:live_score_app/Screens/BottomNavigationScreens/DashBoards/BasketBallTeamInfo/BaskelballTeaminfoSubScreens/BasketballSquads.dart';
import '../../FavouriteScreen/FootballFavoriteBody/Teams/TeamInfo/MatchesTeamInfo/MatchesFixtures.dart';
import '../../FavouriteScreen/FootballFavoriteBody/Teams/TeamInfo/MatchesTeamInfo/MatchesResults.dart';
import '../../FavouriteScreen/FootballFavoriteBody/Teams/TeamInfo/SquadTeamInfo.dart';
import '../../NewsScreens/TabScreens/HotPage.dart';
import '../MatchesDetailed/DetailsTabBodies/FootBallDetailed/FootballStanding.dart';


class BasketballTeamInfo extends StatefulWidget {

  String teamId, teamName, teamLogo, teamCountry;

  BasketballTeamInfo(
      this.teamId,
      this.teamName,
      this.teamLogo,
      this.teamCountry
      );

  @override
  State<BasketballTeamInfo> createState() => _BasketballTeamInfoState();
}

class _BasketballTeamInfoState extends State<BasketballTeamInfo> {

  int selectedTab = 0;
  int selectedTab2 = 0;

  List<String> tabMenuList = [
    "MATCHES",
    "STANDINGS",
    "NEWS",
    "Groups",
  ];

  List<String> tabMenuList2 = [
    "FIXTURES",
    "RESULTS",
  ];

  @override
  Widget build(BuildContext context) {

    List<Widget> mainTabMenuScreenList2 = [
      const SizedBox(),
      B_Standing(isShow: false, leagueId: "3"),
      const HotPage(),
      BasketballGroups(widget.teamId, widget.teamName, widget.teamLogo)
    ];

    List<Widget> tabMenuScreensList2 = [
      BasketBallFixture(teamId: widget.teamId,),
      MatchesResults()
    ];

    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios, size: 20, color: Colors.white,)),
        title: const Text("Team Info", style: TextStyle(color: Colors.white, fontSize: 15),),
      ),
      body: SwipeDetector(
        onSwipeLeft: (offset) {
          if(selectedTab<3){
            setState(() {
              selectedTab = selectedTab+1;
            });
          }
        },
        onSwipeRight: (offset) {
          if(selectedTab>0){
            setState(() {
              selectedTab = selectedTab-1;
            });
          }
        },
        behavior: HitTestBehavior.opaque,
        child: SizedBox(
            height: mediaQuery.size.height,
            width: mediaQuery.size.width,
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ListTile(
                        dense: true,
                        minVerticalPadding: 18,
                        tileColor: const Color(0xff161616),
                        enabled: false,
                        selectedTileColor: const Color(0xff161616),
                        leading: Container(
                          height: 50,
                          width: 50,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      widget.teamLogo.toString()
                                  )
                              ),
                              borderRadius: BorderRadius.circular(8)
                          ),
                        ),
                        title: Text(widget.teamName.toString(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),),
                        subtitle: SizedBox(
                          width: mediaQuery.size.width*0.3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // Container(
                              //   height: 20,
                              //   width: 30,
                              //   margin: const EdgeInsets.symmetric(
                              //       horizontal: 2,
                              //       vertical: 3
                              //   ),
                              //   decoration: BoxDecoration(
                              //       color: Colors.grey.shade300,
                              //       image: DecorationImage(
                              //           image: AssetImage("assets/images/spain.png"),
                              //         fit: BoxFit.cover
                              //       ),
                              //       borderRadius: BorderRadius.circular(5)
                              //   ),
                              // ),
                              Text("\t${widget.teamCountry}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),),
                            ],
                          ),
                        )
                    ),
                    SizedBox(
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
                              color: Colors.black,
                              padding: const EdgeInsets.only(
                                  top: 20,
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
                                  ):const SizedBox()
                                ],
                              )
                          ),
                        );
                      },
                        scrollDirection: Axis.horizontal,
                        itemCount: tabMenuList.length,
                      ),
                    ),
                    secondTabContainer(context)
                  ],
                ),
                Positioned(
                  top: selectedTab==0?
                  mediaQuery.size.height*0.27:
                  mediaQuery.size.height*0.19,
                  left: 0,
                  right: 0,
                  bottom: 30,
                  child: SingleChildScrollView(
                      child: selectedTab==0?
                      tabMenuScreensList2[selectedTab2]:
                      mainTabMenuScreenList2[selectedTab]
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 2,
                  child: Container(
                    height: mediaQuery.size.height*0.06,
                    width: mediaQuery.size.width,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 5
                    ),
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage("assets/images/banner.png"),
                            fit: BoxFit.fill
                        ),
                        color: Colors.grey.shade500,
                        borderRadius: BorderRadius.circular(8)
                    ),
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }

  Widget secondTabContainer(BuildContext context) {

    var mediaQuery = MediaQuery.of(context);

    if(selectedTab == 0){
      return Container(
        color: Colors.black,
        width: mediaQuery.size.width,
        height: mediaQuery.size.height*0.09,
        child: ListView.builder(itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              setState(() {
                selectedTab2 = index;
              }
              );
            },
            child: Container(
                padding: const EdgeInsets.only(
                    top: 15,
                    left: 5,
                    right: 10
                ),
                margin: const EdgeInsets.only(
                    left: 15,
                    right: 5,
                    top: 10
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: mediaQuery.size.width*0.2,
                      height: 30,
                      decoration: BoxDecoration(
                          color: selectedTab2==index?Color(0xff9B8BFF):Color(0xff161616),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: Center(
                        child: Text(tabMenuList2[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: selectedTab2 == index? FontWeight.w900: FontWeight.w600,
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
            ),
          );
        },
          scrollDirection: Axis.horizontal,
          itemCount: tabMenuList2.length,
        ),
      );
    }
    else{
      return const SizedBox();
    }
  }
}
