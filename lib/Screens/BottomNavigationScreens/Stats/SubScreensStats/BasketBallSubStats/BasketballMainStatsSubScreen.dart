import 'package:flutter/material.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';
import '../../../DashBoards/MatchesDetailed/DetailsTabBodies/FootBallDetailed/FootballStanding.dart';
import '../../../DashBoards/MatchesOverviewTabBars/MatchesOverviewTabbarsBody/PlayerStats.dart';

class BasketBallMainSubStatsScreens extends StatefulWidget {
  const BasketBallMainSubStatsScreens({super.key});

  @override
  State<BasketBallMainSubStatsScreens> createState() => _BasketBallMainSubStatsScreensState();
}

class _BasketBallMainSubStatsScreensState extends State<BasketBallMainSubStatsScreens> {
  int selectedTab = 0;

  int boxSelected = 1;

  int boxSelected2 = 0;

  int boxSelected3 = 0;


  List<String> tabMenuListItem2 = [
    "ALL",
    "GOALS",
    "ASSETS",
    "RED CARDS",
    "YELLOW CARDS",
    "SHOTS ON TARGET",
  ];

  List<String> tabMenuList = [
    "TABLE",
    "SEASON LEADERS",
  ];

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    List<Widget> tabScreensList = [
      F_Standing(isShow: false, leagueId: "39"),
      PlayerStatsScreen(selection: boxSelected2, leagueId: "39"),
    ];

    return Scaffold(
      backgroundColor: const Color(0xff161616),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.notifications_outlined, size: 30, color: Colors.white,)
          )
        ],
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20,)),
        leadingWidth: 25,
        backgroundColor: Colors.black,
        title: ListTile(
          enabled: false,
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage("assets/images/LaLiga.png"),
            radius: 16,
          ),
          // trailing: Icon(Icons.arrow_forward_ios, color: Colors.white,),
          subtitle: Text("Spain", style: TextStyle(fontSize: 12, color: Colors.white),),
          title: Text("Laliga", style: TextStyle(fontSize: 15, color: Colors.white),),
          dense: true,
          minLeadingWidth: 1,
        ),
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
                Positioned(
                  top: mediaQuery.size.height*0.1,
                  left: 0,
                  right: 0,
                  bottom: 30,
                  child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: tabScreensList[selectedTab])
                            ],
                          ),
                        ],
                      )
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

                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: mediaQuery.size.height*0.02,
                      color: Colors.black,
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
                                    width: mediaQuery.size.width*0.23,
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
                    teamAndPlayerChooser(context),
                  ],
                ),
              ],
            )
        ),
      ),
    );
  }

  Widget teamAndPlayerChooser(BuildContext context){
    var mediaQuery = MediaQuery.of(context);
    if(selectedTab==1) {
      return Container(
        width: mediaQuery.size.width,
        height: mediaQuery.size.height*0.08,
        color: const Color(0xff161616),
        child: ListView.builder(itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              setState(() {
                boxSelected2 = index;
              });
            },
            child: Container(
                padding: const EdgeInsets.only(
                    top: 15,
                    left: 10,
                    right: 10
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 35,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                          color: boxSelected2==index?Color(0xff9B8BFF): Colors.black,
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: Center(
                        child: Text(tabMenuListItem2[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: boxSelected2 == index? FontWeight.w900: FontWeight.w600,
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
          itemCount: tabMenuListItem2.length,
        ),
      );
    }
    else if(selectedTab==2){
      return Container(
        width: mediaQuery.size.width,
        height: mediaQuery.size.height*0.08,
        color: const Color(0xff161616),
        child: ListView.builder(itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              setState(() {
                boxSelected3 = index;
              });
            },
            child: Container(
                padding: const EdgeInsets.only(
                    top: 15,
                    left: 10,
                    right: 10
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 35,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                          color: boxSelected3==index?Color(0xff9B8BFF): Colors.black,
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: Center(
                        child: Text(tabMenuListItem2[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: boxSelected3 == index? FontWeight.w900: FontWeight.w600,
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
          itemCount: tabMenuListItem2.length,
        ),
      );
    }
    else{
      return const SizedBox();
    }
  }
}

