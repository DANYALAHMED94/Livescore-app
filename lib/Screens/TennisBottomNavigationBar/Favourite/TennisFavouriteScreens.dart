import 'package:flutter/material.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';

import 'Fixtures.dart';
import 'TennisResults.dart';

class TennisFavouriteScreen extends StatefulWidget {
  bool isBack;
  TennisFavouriteScreen({super.key, required this.isBack});

  @override
  State<TennisFavouriteScreen> createState() => _TennisFavouriteScreenState();
}

class _TennisFavouriteScreenState extends State<TennisFavouriteScreen> {

  int selectedTab = 0;

  List<String> tabMenuList = [
    "Fixtures",
    "Results",
  ];

  List<Widget> tabScreensList = [
    Fixtures(),
    Results()
  ];

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return Scaffold(
        backgroundColor: const Color(0xff0D0D0D),
        appBar: AppBar(
          surfaceTintColor: Colors.black,
          backgroundColor: Colors.black,
          title: const Text("FAVOURITE",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          automaticallyImplyLeading: widget.isBack,
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
                                  color: selectedTab==index?Color(0xff9B8BFF):Color(0xff161616),
                                  borderRadius: BorderRadius.circular(8)
                                ),
                                child: Center(
                                  child: Text(tabMenuList[index],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: selectedTab == index? FontWeight.w900: FontWeight.w600,
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
