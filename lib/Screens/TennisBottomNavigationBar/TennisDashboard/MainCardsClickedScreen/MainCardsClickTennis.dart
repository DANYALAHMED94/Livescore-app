import 'package:flutter/material.dart';

import '../../../BottomNavigationScreens/FavouriteScreen/FootballFavoriteBody/Teams/SameFixtures.dart';
import '../../../BottomNavigationScreens/FavouriteScreen/FootballFavoriteBody/Teams/SameResults.dart';

class MainCardsClickedScreens extends StatefulWidget {
  const MainCardsClickedScreens({super.key});

  @override
  State<MainCardsClickedScreens> createState() => _MainCardsClickedScreensState();
}

class _MainCardsClickedScreensState extends State<MainCardsClickedScreens> {


  int selectedTab = 1;

  List<String> tabMenuList = [
    "Results",
    "Fixtures",
  ];

  List<Widget> tabScreensList = [
    const SameResults(),
    const SameFixtures(),
  ];


  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: const Color(0xff161616),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.notifications_outlined, size: 30, color: Colors.white,))
        ],
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 25,)),
        leadingWidth: 25,
        backgroundColor: Colors.black,
        title: ListTile(
          enabled: false,
          leading: Container(
            height: 25,
            width: 30,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/angerschall.png"),
                    fit: BoxFit.fill
                )
            ),
          ),
          // trailing: Icon(Icons.arrow_forward_ios, color: Colors.white,),
          title: Text("Anger Chall, Women", style: TextStyle(fontSize: 15, color: Colors.white),),
          dense: true,
          minLeadingWidth: 1,
        ),
      ),
      body: SizedBox(
        width: mediaQuery.size.width,
        child: Stack(
          children: [
            Positioned(
              top: mediaQuery.size.height*0.1,
              left: 0,
              right: 0,
              bottom: 10,
              child: SingleChildScrollView(
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
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: mediaQuery.size.height*0.03,
                  width: mediaQuery.size.width,
                  color: Colors.black,
                ),
                Container(
                  color: const Color(0xff161616),
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
                                    color: selectedTab==index? Color(0xff9B8BFF) :Colors.black,
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
                    reverse: true,
                  ),
                ),
              ],
            ),
          ],
        )
      ),

    );
  }
}
