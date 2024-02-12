import 'package:flutter/material.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';
import '../../../../../NewsScreens/TabScreens/HotPage.dart';
import 'ProfileMainScreenBodies/CareerBodies/ClubCareerBody.dart';
import 'ProfileMainScreenBodies/CareerBodies/NationalTeam.dart';
import 'ProfileMainScreenBodies/PlayerMatches.dart';
import 'ProfileMainScreenBodies/Transfers.dart';

class PlayerProfileMainScreen extends StatefulWidget {

  String playerName, playerId, playerPhoto, playerAge, playerNumber, teamLogo, teamID, teamName;

  PlayerProfileMainScreen(this.playerName, this.playerId, this.playerAge,
      this.playerNumber, this.playerPhoto, this.teamLogo, this.teamID, this.teamName);

  @override
  State<PlayerProfileMainScreen> createState() => _PlayerProfileMainScreenState();
}

class _PlayerProfileMainScreenState extends State<PlayerProfileMainScreen> {

  int selectedTab = 0;

  int selectedTab2 = 0;

  List<String> tabMenuList2 = [
    "Club",
    "National Team",
  ];

  List<Widget> tabScreensList2 = [
    ClubCareerBody(),
    NationalTeam()
  ];

  List<String> tabMenuList = [
    "Matches",
    "Career Stats",
    "Transfers",
  ];

  List<Widget> tabScreensList = [
    PlayerMatches(),
    HotPage(),
    TransfersPlayerProfile()
  ];

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Player Profile", style: TextStyle(fontSize: 15, color: Colors.white),),
        backgroundColor: Colors.black,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white,)),
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
          width: mediaQuery.size.width,
          height: mediaQuery.size.height,
          child: Stack(
            children: [

              Positioned(
                top: selectedTab==1?mediaQuery.size.height*0.35:mediaQuery.size.height*0.28,
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
                                child: selectedTab==1?
                                tabScreensList2[selectedTab2]:
                                tabScreensList[selectedTab])
                          ],
                        ),
                      ],
                    )
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

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      color: const Color(0xff161616),
                      height: mediaQuery.size.height*0.205,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 25,
                                top: 15,
                                bottom: 5
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            widget.playerPhoto.toString()
                                          ),
                                        fit: BoxFit.fill
                                      ),
                                      borderRadius: BorderRadius.circular(12)
                                  ),

                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          text:  widget.playerName.toString(),
                                          children: <TextSpan>[
                                            TextSpan(text: '(${widget.playerNumber.toString()})',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    inherit: false)
                                            ),
                                          ],
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text: 'Age: ',
                                          children: <TextSpan>[
                                            TextSpan(text: widget.playerAge.toString(),
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    inherit: false)
                                            ),
                                          ],
                                        ),
                                      ),
                                      // Row(
                                      //   children: [
                                      //     RichText(
                                      //       text: TextSpan(
                                      //         text: 'Nationality: ',
                                      //         children: const <TextSpan>[
                                      //           TextSpan(text: ' POLISH\t',
                                      //               style: TextStyle(
                                      //                   fontSize: 15,
                                      //                   fontWeight: FontWeight.bold,
                                      //                   inherit: false)
                                      //           ),
                                      //         ],
                                      //       ),
                                      //     ),
                                      //     // Container(
                                      //     //   height: 20,
                                      //     //   width: 30,
                                      //     //   margin: const EdgeInsets.symmetric(
                                      //     //       horizontal: 2,
                                      //     //       vertical: 3
                                      //     //   ),
                                      //     //   decoration: BoxDecoration(
                                      //     //       color: Colors.grey.shade300,
                                      //     //       image: DecorationImage(
                                      //     //           image: AssetImage("assets/images/spain.png"),
                                      //     //           fit: BoxFit.cover
                                      //     //       ),
                                      //     //       borderRadius: BorderRadius.circular(5)
                                      //     //   ),
                                      //     // ),
                                      //   ],
                                      // )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Divider(color: Colors.grey.shade600,thickness: 0.5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: mediaQuery.size.width*0.5,
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      backgroundImage: NetworkImage(
                                        widget.teamLogo.toString()
                                      ),
                                      radius: 16,
                                    ),
                                    Expanded(
                                      child: Text("\t ${widget.teamName.toString()}",
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                        style: TextStyle(color: Colors.white),),
                                    ),
                                  ],
                                ),
                              ),
                              const Text("Forwards", style: TextStyle(fontSize: 15, color: Colors.white),)
                            ],
                          )
                        ],
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
                                    fontSize: selectedTab == index? 15: 13,
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
                  selectedTab==1?Container(
                    color: Colors.black,
                    width: mediaQuery.size.width,
                    height: mediaQuery.size.height*0.085,
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
                                top: 25,
                                left: 10,
                                right: 10
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8,
                                    horizontal: 15
                                  ),
                                  decoration: BoxDecoration(
                                      color: selectedTab2==index? const Color(0xff9B8BFF): const Color(0xff161616),
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
                  ):SizedBox()
                ],
              ),
            ],
          )
        ),
      ),
    );
  }
}
