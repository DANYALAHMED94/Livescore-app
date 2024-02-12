import 'package:flutter/material.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';
import 'TennisScoreDetailedBody/TennisDetailedBodyHighLights.dart';
import 'TennisScoreDetailedBody/TennisDetailedStatsBody.dart';
import 'TennisScoreDetailedBody/TennisDetailedSummaryBody.dart';

class TennisScoreDetailed extends StatefulWidget {
  TennisScoreDetailed({super.key});

  @override
  State<TennisScoreDetailed> createState() => _TennisScoreDetailedState();
}

class _TennisScoreDetailedState extends State<TennisScoreDetailed> {
  int selectedTab = 0;

  List<String> tabMenuList = [
    "SUMMARY",
    "STATS",
    "HIGHLIGHT",
  ];

  List<Widget> tabScreensList = [
    TennisDetailedSummary(),
    TennisDetailedStatsBody(),
    TennisScoreDetailedHighLightBody()
  ];

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 25,
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
          if(selectedTab<2) {
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
                    Column(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/FC-Barcelona.png"),
                                  fit: BoxFit.fill,
                                  filterQuality: FilterQuality.high
                              )
                          ),
                        ),
                        const SizedBox(height: 10,),
                        const Text(
                          "FC Barcolnia",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white),
                        )
                      ],
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "4 - 0",
                          style: TextStyle(
                              fontSize: 28,
                              fontFamily: 'lucky',
                              color: Colors.white),
                        ),
                        Text(
                          "HT",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/R_madrid.png"),
                                  fit: BoxFit.fill,
                                  filterQuality: FilterQuality.high
                              )
                          ),
                        ),
                        const SizedBox(height: 10,),
                        const Text(
                          "R.Madrid",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white),
                        )
                      ],
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
                top: mediaQuery.size.height*0.25,
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
