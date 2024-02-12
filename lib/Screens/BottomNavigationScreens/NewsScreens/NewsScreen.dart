import 'package:flutter/material.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';

import 'TabScreens/HotPage.dart';

class NewsScreen extends StatefulWidget {
  NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  int selectedTab = 0;

  List<String> tabMenuList = [
    "HOT",
    "FOOTBALL",
    "BASKETBALL",
    "TENNIS",
    "ICE HOCKEY"
  ];


  @override
  Widget build(BuildContext context) {

    var mediaQuery = MediaQuery.of(context);

    List<Widget> tabScreensList = [
      const HotPage(),
      const HotPage(),
      const HotPage(),
      const HotPage(),
      const HotPage(),
    ];

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.black,
        backgroundColor: Colors.black,
        // leading: IconButton(
        //   onPressed: (){},
        //   icon: const Icon(
        //       Icons.arrow_back_ios_new,
        //       size: 20,
        //       color: Colors.white
        //   ),
        // ),
        automaticallyImplyLeading: false,
        title: const Text("NEWS", style: TextStyle(fontSize: 18, color: Colors.white),),
        actions: [
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.notifications_outlined, color: Colors.white),
          ),
          const SizedBox(width: 10,)
        ],
      ),
      backgroundColor: const Color(0xff101010),

      // backgroundColor: const Color(0xff101010),

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
                            left: 10,
                            right: 12
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

              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
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
      )

    );
  }
}
