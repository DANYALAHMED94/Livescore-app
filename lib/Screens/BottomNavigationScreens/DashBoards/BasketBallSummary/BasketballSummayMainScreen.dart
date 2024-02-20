import 'package:flutter/material.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';
import 'package:live_score_app/Screens/BottomNavigationScreens/DashBoards/BasketBallSummary/SubScreenSummary/BasketBallSummary.dart';
import 'package:live_score_app/Screens/BottomNavigationScreens/DashBoards/BasketBallSummary/SubScreenSummary/BasketballLineUps.dart';
import 'package:live_score_app/Screens/BottomNavigationScreens/DashBoards/BasketBallSummary/SubScreenSummary/BasketballStandings.dart';
import 'package:live_score_app/Screens/BottomNavigationScreens/DashBoards/BasketBallSummary/SubScreenSummary/BasketballStats.dart';
import '../../NewsScreens/TabScreens/HotPage.dart';

class BasketballSummaryMainScreen extends StatefulWidget {
  bool isFootball;
  String team1Name,
      team1Logo,
      team2Name,
      team2Logo,
      team1Score,
      team2Score,
      teamsStatus,
      fixtureId;

  BasketballSummaryMainScreen(
      this.isFootball,
      this.team1Name,
      this.team1Logo,
      this.team2Name,
      this.team2Logo,
      this.team1Score,
      this.team2Score,
      this.teamsStatus,
      this.fixtureId
      );

  @override
  State<BasketballSummaryMainScreen> createState() => _BasketballSummaryMainScreenState();
}

class _BasketballSummaryMainScreenState extends State<BasketballSummaryMainScreen> {

  int selectedTab = 0;

  List<String> tabMenuList = [
    "SUMMARY",
    "STATS",
    "LINEUPS",
    "STANDINGS",
    "NEWS"
  ];

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    List<Widget> tabScreensList = [
      BasketBallSummary(),
      BasketballStats(fixtureId: widget.fixtureId),
      BasketballLineUps(isShowGround: widget.isFootball, fixtureId: widget.fixtureId,),
       BasketballStandings(isShow: true,leagueId: "39"),
      const HotPage(),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 20,
              color: Colors.white,
            )
        ),
        actions: [
          IconButton(
              onPressed: (){},
              icon: const Icon(
                Icons.notifications_outlined,
                size: 25,
                color: Colors.white,
              )
          ),
        ],

      ),
      backgroundColor: const Color(0xff161616),
      body: SwipeDetector(
        onSwipeLeft: (offset) {
          if(selectedTab<4){
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
            clipBehavior: Clip.none,
            children: [
              Container(
                height: mediaQuery.size.height*0.18,
                width: mediaQuery.size.width,
                color: Colors.black,
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 90,
                      width: mediaQuery.size.width*0.3,
                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        widget.team1Logo
                                    ),
                                    fit: BoxFit.fill,
                                    filterQuality: FilterQuality.high
                                )
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Text(
                            widget.team1Name,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white
                            ),
                          )
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${widget.team1Score} - ${widget.team2Score}",
                          style: TextStyle(
                              fontSize: 28,
                              fontFamily: 'lucky',
                              color: Colors.white),
                        ),
                        Text(
                          widget.teamsStatus,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 90,
                      width: mediaQuery.size.width*0.3,
                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        widget.team2Logo
                                    ),
                                    fit: BoxFit.fill,
                                    filterQuality: FilterQuality.high
                                )
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Text(
                            widget.team2Name,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                top: mediaQuery.size.height*0.18,
                left: 0,
                right: 0,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
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
                ),
              ),
              Positioned(
                top: mediaQuery.size.height*0.27,
                bottom: mediaQuery.size.height*0.07,
                left: 0,
                right: 0,
                child: tabScreensList[selectedTab],
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
          ),
        ),
      ),
    );
  }
}
