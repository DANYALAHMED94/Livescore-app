import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../BasketBallSummary/BasketballSummayMainScreen.dart';
import '../../MatchesDetailed/MatchDetailes.dart';
import 'package:http/http.dart' as http;

class BasketballOverview extends StatelessWidget {

  int selection;
  bool isFootball;
  String leagueId;

  BasketballOverview({
    super.key,
    required this.selection,
    required this.isFootball,
    required this.leagueId
  });

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return SizedBox(
      height:  mediaQuery.size.height*0.72,
      child: Stack(
        children: [
          Positioned(
            top: mediaQuery.size.height*0.05,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
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

                        // return Text(response.toString(), style: TextStyle(fontSize: 12, color: Colors.white),);

                        // return ListView.builder(
                        //     itemBuilder: (context, index) {
                        //       // return cardsBuilder(
                        //       //   response[index]["teams"]["home"]["name"].toString(),
                        //       //   response[index]["teams"]["away"]["name"].toString(),
                        //       //   response[index]["date"].toString(),
                        //       //   response[index]["status"]["short"].toString(),
                        //       //   response[index]["scores"]["home"]["total"].toString(),
                        //       //   response[index]["scores"]["away"]["total"].toString(),
                        //       // );
                        //       return Container(
                        //         margin: EdgeInsets.symmetric(
                        //           horizontal: 10,
                        //           vertical: 10,
                        //         ),
                        //         color: Colors.green,
                        //       );
                        //     },
                        //   padding: EdgeInsets.symmetric(
                        //     vertical: 0,
                        //     horizontal: 0,
                        //   ),
                        //   itemExtent: 60,
                        //   itemCount: response.length,
                        // );

                        return Column(
                          children: [
                            SizedBox(
                              height: mediaQuery.size.height*0.7,
                              width: mediaQuery.size.width,
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 5,),
                                      GestureDetector(
                                        onTap: (){
                                          Navigator
                                              .push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => BasketballSummaryMainScreen(
                                                    false,
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
                                                          Text(
                                                            DateFormat("HH:mm a").format(DateTime.parse(response[index]["date"].toString())),
                                                            style: TextStyle(color:  Color(0xff9B8BFF)),),
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget cardsBuilder(
      String team1,
      String team2,
      String time,
      String status,
      String team1Score,
      String team2Score,
      )
  {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xff0D0D0D),
          borderRadius: BorderRadius.circular(8)
      ),
      margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5
      ),
      child: ListTile(
        leading: SizedBox(
          height: 50,
          width: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat("HH:mm a").format(DateTime.parse(time)),
                    style: TextStyle(color: Color(0xff9B8BFF)),),
                  selection==0?Text(status, style: TextStyle(color: Color(0xff9B8BFF)),):SizedBox()
                ],
              ),
              const SizedBox(width: 10,),
              Container(
                height: 50,
                width: 1,
                color: Colors.grey.shade600,
              )
            ],
          ),
        ),
        minLeadingWidth: 30,
        title: Text(
          team1,
          style: TextStyle(
              color: Colors.white
          ),
        ),
        subtitle: Text(team2, style: TextStyle(color: Colors.white),),
        trailing: SizedBox(
          height: 50,
          width: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  selection==0?Text(team1Score, style: TextStyle(color: Colors.white),):SizedBox(),
                  selection==0?Text(team2Score, style: TextStyle(color: Colors.white),):SizedBox()
                ],
              ),
              Icon(
                Icons.notifications,
                color: Color(0xff9B8BFF),)
            ],
          ),
        ),
      ),
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
        Uri.parse('https://v1.basketball.api-sports.io/games?season=2020-2021&league=$leagueId')
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
