import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:live_score_app/Screens/BottomNavigationScreens/DashBoards/Basketball-League-Overview/BasketballLeagueOverviewMain.dart';
import '../../DashBoards/BasketBallSummary/BasketballSummayMainScreen.dart';

class BasketBallMatches extends StatelessWidget {
  const BasketBallMatches({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(height: 5,),
        SingleChildScrollView(
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
                            height: mediaQuery.size.height*0.72,
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
                                                  BasketballLeagueOverviewMain(
                                                      isFootball: false,
                                                      leagueID: response[index]["league"]["id"].toString(),
                                                      name: response[index]["league"]["name"].toString(),
                                                      country: response[index]["country"]["name"].toString(),
                                                      logo: response[index]["league"]["logo"].toString()
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
                                      title: Text(response[index]["league"]["name"].toString(),
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                        style: TextStyle(color: Colors.white,
                                        ),),
                                    ),
                                    const SizedBox(height: 5,),
                                    GestureDetector(
                                      onTap: (){
                                        Navigator
                                            .push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => BasketballSummaryMainScreen(
                                                  true,
                                                  response[index]["teams"]["home"]["name"].toString(),
                                                  response[index]["teams"]["home"]["logo"].toString(),
                                                  response[index]["teams"]["away"]["name"].toString(),
                                                  response[index]["teams"]["away"]["logo"].toString(),
                                                  response[index]["scores"]["home"]["total"].toString(),
                                                  response[index]["scores"]["away"]["total"].toString(),
                                                  response[index]["status"]["short"].toString(),
                                                  response[index]["league"]["id"].toString(),
                                                  response[index]["id"].toString(),
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
                                                        Text(DateFormat("HH:mm a").format(DateTime.parse(response[index]["date"].toString())), style: TextStyle(color:  Color(0xff9B8BFF)),),
                                                        Text(response[index]["status"]["short"].toString(), style: TextStyle(color: Color(0xff9B8BFF)),),
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
                                                width: 50,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        Text(response[index]["scores"]["home"]["total"].toString(), style: TextStyle(color: Colors.white, fontSize: 12),),
                                                        Text(response[index]["scores"]["away"]["total"].toString(), style: TextStyle(color: Colors.white, fontSize: 12),),
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
      ],
    );
  }

  Future fixtureInformation() async{

    const String apiKey = "0a9ce6deb596f61f4e33463c192bd31c";

    var headers = {
      'x-rapidapi-key': apiKey,
      'x-rapidapi-host': 'https://api-basketball.p.rapidapi.com/games'
    };

    var request = http.Request(
        'GET',
        Uri.parse('https://v1.basketball.api-sports.io/games?season=2020-2021&league=3')
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
