import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../../../../../DashBoards/MatchesDetailed/MatchDetailes.dart';
import '../../../../../DashBoards/MatchesOverviewTabBars/MatchesOverviewTabBars.dart';

class MatchesResults extends StatelessWidget {
  const MatchesResults({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return FutureBuilder(
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

          // return Text(snapshot.data.toString(), style: TextStyle(fontSize: 12, color: Colors.white),);

          return SizedBox(
            height: mediaQuery.size.height*0.9,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5,),
                    ListTile(
                      horizontalTitleGap: 20,
                      tileColor: const Color(0xff161616),
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
                        Navigator.push(
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
                                  response[index]["league"]["id"].toString(),
                                  response[index]["league"]["season"].toString(),
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
                            trailing: Text(DateFormat("HH:mm a").format(DateTime.parse(response[index]["fixture"]["date"].toString())), style: TextStyle(color: Colors.grey, fontSize: 12),),
                          ),
                        ),
                      ),
                    )

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
          );
        }
        else {
          return const Text("Sorry Their is an Server Issue Occurring",
            style: TextStyle(fontSize: 12, color: Colors.white),
          );
        }

      },
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
        Uri.parse('https://v3.football.api-sports.io/fixtures?date=${DateFormat("yyyy-MM-dd").format(DateTime.now())}')
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
