import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../setting_screen.dart';
import '../MatchesMenusSelections.dart';
import '../FootBallSearchIcon.dart';
import 'MatchesDetailed/MatchDetailes.dart';
import 'MatchesOverviewTabBars/MatchesOverviewTabBars.dart';
import 'package:http/http.dart' as http;

class FootBallDashBoardScreen extends StatefulWidget {
  const FootBallDashBoardScreen({super.key});

  @override
  State<FootBallDashBoardScreen> createState() => _FootBallDashBoardScreenState();
}

class _FootBallDashBoardScreenState extends State<FootBallDashBoardScreen> {

  int selectedDateTime=0;

  int selectedImageLevel=0;

  List<String> imagesDashboard = [
    "assets/images/FootballdashboardImages.png",
    "assets/images/FootballdashboardImages2.png",
    "assets/images/FootballdashboardImages3.png",
  ];

  bool isLive=false;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0D0D0D),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>
                const FootballSearchIcon(),));
          }, icon: const Icon(Icons.search, size: 28, color: Colors.white,)),
          Padding(
            padding: const EdgeInsets.only(
                right: 8
            ),
            child: IconButton(onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SettingScreen()));
            }, icon: const Icon(Icons.dehaze, size: 28,color: Colors.white,)),
          )
        ],
        leadingWidth: mediaQuery.size.width*0.35,
        surfaceTintColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                    const MatchesMenusSelector()));
          },
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("\tFOOTBALL", style: TextStyle(color: Colors.white, fontSize: 13),),
                Icon(Icons.arrow_drop_down, color: Colors.white,size: 25,)
              ],
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xff101010),
      body: Stack(
        children: [

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                color: const Color(0xff0D0D0D),
                margin: const EdgeInsets.only(
                  bottom: 10
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12
                ),
                height: mediaQuery.size.height*0.07,
                width: mediaQuery.size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        if(isLive==true){
                          isLive = false;
                        }
                        else{
                          isLive = true;
                        }
                        setState(() {

                        });
                      },
                      child: Container(
                        height: 27,
                        width: 55,
                        decoration: BoxDecoration(
                          color: isLive?const Color(0xff9B8BFF):Colors.grey,
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("LIVE",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,

                              ),
                            ),
                          ],
                        )
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5
                        ),
                        child: ListView.builder(itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: (){
                              setState(() {
                                selectedDateTime = index;
                              });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Sun",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: selectedDateTime == index?Colors.white:Colors.grey),),
                                Text("28 Oct",
                                  style: TextStyle(
                                      fontSize: 9,
                                      color: selectedDateTime == index?Colors.white:Colors.grey),),
                              ],
                            ),
                          );
                        },
                          scrollDirection: Axis.horizontal,
                          itemExtent: 42,
                          itemCount: 10,
                        ),
                      ),
                    ),
                    const Icon(Icons.calendar_month_outlined, size: 25,color: Colors.white,)
                  ],
                ),
              ),
              // const Divider(
              //   color: Colors.grey,
              //   thickness: 0.5,
              // ),
              SizedBox(
                height: mediaQuery.size.height*0.135,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        if(selectedImageLevel==2){
                          setState(() {
                            selectedImageLevel = 0;
                          });
                        }
                        else{
                          setState(() {
                            selectedImageLevel = selectedImageLevel+1;
                          });
                        }
                      },
                      child: Container(
                        height: mediaQuery.size.height*0.11,
                        width: mediaQuery.size.width*0.9,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(imagesDashboard[selectedImageLevel]),
                                fit: BoxFit.fill
                            ),
                            // color: Colors.grey.shade500,
                            borderRadius: BorderRadius.circular(8)
                        ),
                      ),
                    ),
                    SizedBox(
                      height: mediaQuery.size.height*0.025,
                      width: mediaQuery.size.width*0.4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for(int i=0;i<3;i++) SizedBox(
                            width: 30,
                            child: Divider(
                                thickness: 2,
                                color: i<=selectedImageLevel?Colors.white:Colors.grey.shade800),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),

          Positioned(
            top: mediaQuery.size.height*0.22,
            left: 0,
            right: 0,
            bottom: 50,
            child: SingleChildScrollView(
              child: SizedBox(
                height: mediaQuery.size.height*1.13,
                child: Column(
                  children: [
                    FutureBuilder(
                        future: fixtureInformation(),
                        builder: (context, snapshot) {
                          if(snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                backgroundColor: Colors.grey,
                              ),
                            );
                          }
                          else if(snapshot.hasData) {

                            var mapData = jsonDecode(snapshot.data.toString());
                            var response = mapData["response"];

                            return Column(
                              children: [
                                // SizedBox(
                                //   height: mediaQuery.size.height*0.3,
                                //   width: mediaQuery.size.width,
                                //   child: Column(
                                //     mainAxisAlignment: MainAxisAlignment.center,
                                //     children: [
                                //       ListTile(
                                //         onTap: (){
                                //           Navigator.push(context,
                                //               MaterialPageRoute(
                                //                 builder: (context) =>
                                //                     FavouriteScreen(
                                //                       selectedFavourite: 'Football',
                                //                       isBackEnabled: true,
                                //                     ),
                                //               )
                                //           );
                                //         },
                                //         leading: const Icon(Icons.notifications, color: Color(0xff9B8BFF),),
                                //         trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18,),
                                //         title: const Text("Favourite", style: TextStyle(fontSize: 15, color: Colors.white),),
                                //         dense: true,
                                //       ),
                                //       Expanded(
                                //           child: ListView.builder(itemBuilder: (context, index) {
                                //             return GestureDetector(
                                //                 onTap: (){
                                //                   Navigator.push(context,
                                //                       MaterialPageRoute(
                                //                         builder: (context) =>
                                //                             MatchDetails(isFootball: true),
                                //                       )
                                //                   );
                                //                 },
                                //                 child: ListContainersDashboard(index: index,));
                                //           },
                                //             itemExtent: 80,
                                //             itemCount: 2,
                                //             physics: const NeverScrollableScrollPhysics(),
                                //           )
                                //       ),
                                //     ],
                                //   ),
                                //
                                // ),
                                SizedBox(
                                  height: mediaQuery.size.height*0.5,
                                  width: mediaQuery.size.width,
                                  child: ListView.builder(
                                    itemBuilder: (context, index) {
                                      return Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 5,),
                                          ListTile(
                                            onTap: (){
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        MatchesOverviewTabBars(
                                                            isFootball: true
                                                        ),
                                                  )
                                              );
                                            },
                                            dense: true,
                                            horizontalTitleGap: 20,
                                            tileColor: Colors.transparent,
                                            leading: CircleAvatar(
                                              backgroundColor: Colors.transparent,
                                              backgroundImage: NetworkImage(
                                                  response[index]["league"]["logo"].toString()
                                              ),
                                            ),
                                            title: Text(response[index]["league"]["name"].toString(), style: TextStyle(color: Colors.white,
                                            ),),
                                          ),
                                          const SizedBox(height: 5,),
                                          GestureDetector(
                                            onTap: (){
                                              Navigator
                                                  .push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) => MatchDetails(
                                                        true,
                                                        response[index]["teams"]["home"]["name"].toString(),
                                                        response[index]["teams"]["home"]["logo"].toString(),
                                                        response[index]["teams"]["away"]["name"].toString(),
                                                        response[index]["teams"]["away"]["logo"].toString(),
                                                        response[index]["goals"]["home"].toString(),
                                                        response[index]["goals"]["away"].toString(),
                                                        response[index]["fixture"]["status"]["short"].toString(),
                                                        response[index]["fixture"]["id"].toString(),
                                                      )
                                                  )
                                              );
                                            },
                                            child: Container(
                                              width: mediaQuery.size.width,
                                              margin: const EdgeInsets.symmetric(
                                                  horizontal: 20,
                                                  vertical: 7
                                              ),
                                              decoration: BoxDecoration(
                                                  color: const Color(0xff161616),
                                                  borderRadius: BorderRadius.circular(10)
                                              ),
                                              child: Center(
                                                child: ListTile(
                                                  dense: true,
                                                  leading: SizedBox(
                                                    height: 50,
                                                    width: mediaQuery.size.width*0.18,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Column(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Text(DateFormat("HH:mm a").format(DateTime.parse(response[index]["fixture"]["date"].toString())), style: TextStyle(color:  Color(0xff9B8BFF)),),
                                                            Text(response[index]["fixture"]["status"]["short"].toString(), style: TextStyle(color: Color(0xff9B8BFF)),),
                                                          ],
                                                        ),
                                                        Container(
                                                          height: 50,
                                                          width: 2,
                                                          color: Colors.grey,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  minLeadingWidth: 50,
                                                  title: Text(response[index]["teams"]["home"]["name"].toString(), style: TextStyle(color: Colors.white),),
                                                  subtitle: Text(response[index]["teams"]["away"]["name"].toString(), style: TextStyle(color: Colors.white),),
                                                  trailing: SizedBox(
                                                    height: 50,
                                                    width: 40,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Column(
                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                          children: [
                                                            Text(response[index]["goals"]["home"].toString(), style: TextStyle(color: Colors.white, fontSize: 12),),
                                                            Text(response[index]["goals"]["away"].toString(), style: TextStyle(color: Colors.white, fontSize: 12),),
                                                          ],
                                                        ),
                                                        const Icon(Icons.notifications_outlined, color: Color(0xff9B8BFF),)
                                                      ],
                                                    ),
                                                  )
                                                ),
                                              ),
                                            ),
                                          ),

                                          // const SizedBox(height: 5,),
                                          // const ListTile(
                                          //   horizontalTitleGap: 20,
                                          //   tileColor: Color(0xff161616),
                                          //   leading: CircleAvatar(
                                          //     backgroundColor: Colors.transparent,
                                          //     radius: 16,
                                          //     backgroundImage: AssetImage("assets/images/LaLiga.png"),
                                          //   ),
                                          //   title: Text("LALIGA", style: TextStyle(color: Colors.white,
                                          //   ),),
                                          // ),
                                          // const SizedBox(height: 5,),
                                          // SizedBox(
                                          //   height: mediaQuery.size.height*0.54,
                                          //   child: ListView.builder(itemBuilder: (context, index) {
                                          //     return GestureDetector(
                                          //       onTap: (){
                                          //         Navigator.push(context, MaterialPageRoute(builder: (context) => MatchesOverviewTabBars(isFootball: false),));
                                          //       },
                                          //       child: Container(
                                          //         width: mediaQuery.size.width,
                                          //         margin: const EdgeInsets.symmetric(
                                          //             horizontal: 20,
                                          //             vertical: 7
                                          //         ),
                                          //         decoration: BoxDecoration(
                                          //             color: const Color(0xff161616),
                                          //             borderRadius: BorderRadius.circular(10)
                                          //         ),
                                          //         child: Center(
                                          //           child: ListTile(
                                          //             dense: true,
                                          //             leading: SizedBox(
                                          //               height: 50,
                                          //               width: mediaQuery.size.width*0.18,
                                          //               child: Row(
                                          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          //                 children: [
                                          //                   const Column(
                                          //                     mainAxisAlignment: MainAxisAlignment.center,
                                          //                     children: [
                                          //                       Text("8:00 AM", style: TextStyle(color: const Color(0xff9B8BFF)),),
                                          //                       Text("HT", style: TextStyle(color: const Color(0xff9B8BFF)),),
                                          //                     ],
                                          //                   ),
                                          //                   Container(
                                          //                     height: 50,
                                          //                     width: 2,
                                          //                     color: Colors.grey,
                                          //                   )
                                          //                 ],
                                          //               ),
                                          //             ),
                                          //             minLeadingWidth: 50,
                                          //             title: Text("FC Barcelona", style: TextStyle(color: Colors.white),),
                                          //             subtitle: Text("Real Madrid", style: TextStyle(color: Colors.white),),
                                          //             trailing: Text("09:00 pm", style: TextStyle(color: Colors.grey, fontSize: 12),),
                                          //           ),
                                          //         ),
                                          //       ),
                                          //     );
                                          //   },
                                          //     scrollDirection: Axis.vertical,
                                          //     itemExtent: 100,
                                          //     itemCount: 4,
                                          //     physics: NeverScrollableScrollPhysics(),
                                          //   ),
                                          // ),
                                        ],
                                      );
                                    },
                                    itemCount: response.length,
                                    physics: BouncingScrollPhysics(),
                                  ),
                                ),
                              ],
                            );
                          }
                          else {
                            return const Text("Sorry Their is an Server Issue Occurring",
                              style: TextStyle(fontSize: 12, color: Colors.white),
                            );
                          }
                        },
                    ),
                    // Expanded(
                    //     child: Column(
                    //       children: [
                    //         SizedBox(
                    //           height: 60,
                    //           child: Center(
                    //             child: ListTile(
                    //               onTap: (){
                    //                 Navigator.push(context,
                    //                     MaterialPageRoute(
                    //                         builder: (context) =>
                    //                             MatchesOverviewTabBars(isFootball: true,)
                    //                     )
                    //                 );
                    //               },
                    //               leading: const CircleAvatar(
                    //                   radius: 20,
                    //                   backgroundColor: Colors.transparent,
                    //                   backgroundImage: AssetImage("assets/images/epl.png")
                    //               ),
                    //               trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18,),
                    //               subtitle: Text("England", style: TextStyle(fontSize: 12, color: Colors.white),),
                    //               title: Text("EPL", style: TextStyle(fontSize: 15, color: Colors.white),),
                    //               dense: true,
                    //             ),
                    //           ),
                    //         ),
                    //         Expanded(
                    //             child: ListView.builder(itemBuilder: (context, index) {
                    //               return GestureDetector(
                    //                   onTap: (){
                    //                     Navigator.push(context,
                    //                         MaterialPageRoute(
                    //                           builder: (context) =>
                    //                               MatchDetails(isFootball: true),
                    //                         )
                    //                     );
                    //                   },
                    //                   child: ListContainersDashboard(index: index,));
                    //             },
                    //               itemExtent: 80,
                    //               itemCount: 2,
                    //               physics: const NeverScrollableScrollPhysics(),
                    //             )
                    //         ),
                    //       ],
                    //     )
                    // ),
                    // Expanded(
                    //     child: Column(
                    //       children: [
                    //         ListTile(
                    //           onTap: (){
                    //             Navigator.push(context,
                    //                 MaterialPageRoute(
                    //                     builder: (context) =>
                    //                         MatchesOverviewTabBars(isFootball: true,)
                    //                 )
                    //             );
                    //           },
                    //           leading: CircleAvatar(
                    //               radius: 16,
                    //               backgroundColor: Colors.transparent,
                    //               backgroundImage: AssetImage("assets/images/LaLiga.png")
                    //           ),
                    //           trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18,),
                    //           subtitle: Text("Spain", style: TextStyle(fontSize: 15, color: Colors.white),),
                    //           title: Text("Laliga", style: TextStyle(fontSize: 15, color: Colors.white),),
                    //           dense: true,
                    //         ),
                    //         Expanded(
                    //             child: ListView.builder(itemBuilder: (context, index) {
                    //               return GestureDetector(
                    //                   onTap: (){
                    //                     Navigator.push(context,
                    //                         MaterialPageRoute(
                    //                           builder: (context) =>
                    //                               MatchDetails(isFootball: true),
                    //                         )
                    //                     );
                    //                   },
                    //                   child: ListContainersDashboard(index: index,));
                    //             },
                    //               itemExtent: 80,
                    //               itemCount: 2,
                    //               physics: const NeverScrollableScrollPhysics(),
                    //             )
                    //         ),
                    //       ],
                    //     )
                    // ),
                  ],
                ),
              ),
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
    );
  }

  Future fixtureInformation() async{

    const String apiKey = "0a9ce6deb596f61f4e33463c192bd31c";

    var headers = {
      'x-rapidapi-key': apiKey,
      'x-rapidapi-host': 'https://api-football-v1.p.rapidapi.com/v3/fixtures'
    };
    var request = http.Request(
        'GET',
        Uri.parse('https://v3.football.api-sports.io/fixtures?league=39&season=2021')
    );

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return await response.stream.bytesToString();
    }
    else {
      return response.reasonPhrase;
    }
  }
}
