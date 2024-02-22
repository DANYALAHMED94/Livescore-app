import 'package:flutter/material.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';
import '../../NewsScreens/TabScreens/HotPage.dart';
import '../MatchesDetailed/DetailsTabBodies/FootBallDetailed/FootballStanding.dart';
// import '../MatchesOverviewTabBars/MatchesOverviewTabbarsBody/Overview.dart';
import 'BasketBallLeagueOverviewSubScreens/BasketballOverviewBody.dart';

class BasketballLeagueOverviewMain extends StatefulWidget {

  bool isFootball;

  String name, country, logo, leagueID;

  BasketballLeagueOverviewMain({
    super.key,
    required this.leagueID,
    required this.isFootball,
    required this.name,
    required this.country,
    required this.logo
  });

  @override
  State<BasketballLeagueOverviewMain> createState() => _BasketballLeagueOverviewMainState();
}

class _BasketballLeagueOverviewMainState extends State<BasketballLeagueOverviewMain> {
  int selectedTab = 0;

  int boxSelected = 1;

  List<String> tabMenuListItem = [
    "Results",
    "Fixtures",
  ];

  List<String> tabMenuList = [
    "OVERVIEW",
    "TABLE",
    "NEWS"
  ];

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    List<Widget> tabScreensList = [
      BasketballOverview(selection: boxSelected, isFootball: widget.isFootball, leagueId: widget.leagueID),
      F_Standing(isShow: false,leagueId: widget.leagueID),
      const HotPage(),
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.notifications_outlined, size: 30, color: Colors.white,))
        ],
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20,)),
        leadingWidth: 25,
        backgroundColor: Colors.black,
        title: ListTile(
          enabled: false,
          leading: CircleAvatar(
              radius: 16,
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage(
                widget.logo
              )
          ),
          subtitle: Text(widget.country, style: const TextStyle(fontSize: 12, color: Colors.white),),
          title: Text(widget.name, style: const TextStyle(fontSize: 15, color: Colors.white),),
          dense: true,
          minLeadingWidth: 1,
        ),
      ),
      body: SwipeDetector(
        onSwipeLeft: (offset) {
          if(selectedTab<2){
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
                                      color: selectedTab == index? const Color(0xff9B8BFF):Colors.white,
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
                    selectedTab==0?Container(
                      width: mediaQuery.size.width,
                      height: mediaQuery.size.height*0.07,
                      color: Colors.black,
                      child: ListView.builder(itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            setState(() {
                              boxSelected = index;
                            }
                            );
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
                                    width: mediaQuery.size.width*0.2,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: boxSelected==index?Color(0xff9B8BFF): Color(0xff161616),
                                        borderRadius: BorderRadius.circular(8)
                                    ),
                                    child: Center(
                                      child: Text(tabMenuListItem[index],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: boxSelected == index? FontWeight.w900: FontWeight.w600,
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
                        itemCount: tabMenuListItem.length,
                        reverse: true,
                      ),
                    ):SizedBox(),
                  ],
                ),
              ],
            )
        ),
      ),
    );
  }
}
