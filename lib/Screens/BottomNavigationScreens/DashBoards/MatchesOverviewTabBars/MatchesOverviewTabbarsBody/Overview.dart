import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../MatchesDetailed/MatchDetailes.dart';
import 'package:http/http.dart' as http;

class OverViewBody extends StatelessWidget {

  int selection;
  bool isFootball;
  String leagueId;

  OverViewBody({
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

                        return SizedBox(
                          height: mediaQuery.size.height*0.7,
                          width: mediaQuery.size.width,
                          child: ListView.builder(
                              itemBuilder: (context, index) {
                                return GestureDetector(
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
                                              response[index]["league"]["id"].toString(),
                                            )
                                        )
                                    );
                                  },
                                  child: cardsBuilder(
                                      response[index]["teams"]["home"]["name"].toString(),
                                      response[index]["teams"]["away"]["name"].toString(),
                                      response[index]["goals"]["home"].toString(),
                                      response[index]["goals"]["away"].toString(),
                                      response[index]["fixture"]["date"].toString(),
                                      response[index]["fixture"]["status"]["short"].toString()
                                  ),
                                  // child: Container(
                                  //   width: mediaQuery.size.width,
                                  //   margin: const EdgeInsets.symmetric(
                                  //       horizontal: 20,
                                  //       vertical: 7
                                  //   ),
                                  //   decoration: BoxDecoration(
                                  //       color: const Color(0xff161616),
                                  //       borderRadius: BorderRadius.circular(10)
                                  //   ),
                                  //   child: Center(
                                  //     child: ListTile(
                                  //         dense: true,
                                  //         leading: SizedBox(
                                  //           height: 50,
                                  //           width: mediaQuery.size.width*0.18,
                                  //           child: Row(
                                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //             children: [
                                  //               Column(
                                  //                 mainAxisAlignment: MainAxisAlignment.center,
                                  //                 children: [
                                  //                   Text(DateFormat("HH:mm a").format(DateTime.parse(response[index]["fixture"]["date"].toString())), style: TextStyle(color:  Color(0xff9B8BFF)),),
                                  //                   Text(response[index]["fixture"]["status"]["short"].toString(), style: TextStyle(color: Color(0xff9B8BFF)),),
                                  //                 ],
                                  //               ),
                                  //               Container(
                                  //                 height: 50,
                                  //                 width: 2,
                                  //                 color: Colors.grey,
                                  //               )
                                  //             ],
                                  //           ),
                                  //         ),
                                  //         minLeadingWidth: 50,
                                  //         title: Text(response[index]["teams"]["home"]["name"].toString(), style: TextStyle(color: Colors.white),),
                                  //         subtitle: Text(response[index]["teams"]["away"]["name"].toString(), style: TextStyle(color: Colors.white),),
                                  //         trailing: SizedBox(
                                  //           height: 50,
                                  //           width: 40,
                                  //           child: Row(
                                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //             children: [
                                  //               Column(
                                  //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  //                 children: [
                                  //                   Text(response[index]["goals"]["home"].toString(), style: TextStyle(color: Colors.white, fontSize: 12),),
                                  //                   Text(response[index]["goals"]["away"].toString(), style: TextStyle(color: Colors.white, fontSize: 12),),
                                  //                 ],
                                  //               ),
                                  //               const Icon(Icons.notifications_outlined, color: Color(0xff9B8BFF),)
                                  //             ],
                                  //           ),
                                  //         )
                                  //     ),
                                  //   ),
                                  // ),
                                );
                              },
                            itemCount: response.length,
                          ),
                        );
                      }
                      else {
                        return const Text("Sorry Their is an Server Issue Occurring",
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        );
                      }
                    },
                  ),

                  // SizedBox(
                  //     width: mediaQuery.size.width,
                  //     height: mediaQuery.size.height*0.38,
                  //     child: Column(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         const ListTile(
                  //           title: Text("Today", style: TextStyle(fontSize: 18, color: Colors.white),),
                  //           dense: true,
                  //         ),
                  //         Expanded(
                  //             child: ListView.builder(itemBuilder: (context, index) {
                  //               return GestureDetector(
                  //                   onTap: (){
                  //                     Navigator.push(context,
                  //                         MaterialPageRoute(
                  //                           builder: (context) =>
                  //                               MatchDetails(
                  //                                 false,
                  //                                 "",
                  //                                 "",
                  //                                 "",
                  //                                 "",
                  //                                 "",
                  //                                 "",
                  //                                 "",
                  //                                 "",
                  //                               ),
                  //                         )
                  //                     );
                  //                   },
                  //                   child: cardsBuilder(index)
                  //               );
                  //             },
                  //               itemExtent: 80,
                  //               itemCount: 3,
                  //               physics: const NeverScrollableScrollPhysics(),
                  //             )
                  //         ),
                  //       ],
                  //     )
                  // ),
                  // SizedBox(
                  //     width: mediaQuery.size.width,
                  //     height: mediaQuery.size.height*0.195,
                  //     child: Column(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         const ListTile(
                  //           subtitle: Text("Group E", style: TextStyle(fontSize: 12, color: Colors.white),),
                  //           title: Text("Today", style: TextStyle(fontSize: 18, color: Colors.white),),
                  //           dense: true,
                  //         ),
                  //         Expanded(
                  //             child: ListView.builder(itemBuilder: (context, index) {
                  //               return GestureDetector(
                  //                   onTap: (){
                  //                     Navigator.push(context,
                  //                         MaterialPageRoute(
                  //                           builder: (context) =>
                  //                               MatchDetails(
                  //                                 false,
                  //                                 "",
                  //                                 "",
                  //                                 "",
                  //                                 "",
                  //                                 "",
                  //                                 "",
                  //                                 "",
                  //                                 "",
                  //                               ),
                  //                         )
                  //                     );
                  //                   },
                  //                   child: cardsBuilder(index));
                  //             },
                  //               itemExtent: 80,
                  //               itemCount: 3,
                  //               physics: const NeverScrollableScrollPhysics(),
                  //             )
                  //         ),
                  //       ],
                  //     )
                  // ),
                  // SizedBox(
                  //     width: mediaQuery.size.width,
                  //     height: mediaQuery.size.height*0.195,
                  //     child: Column(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         const ListTile(
                  //           subtitle: Text("Group E", style: TextStyle(fontSize: 12, color: Colors.white),),
                  //           title: Text("Today", style: TextStyle(fontSize: 18, color: Colors.white),),
                  //           dense: true,
                  //         ),
                  //         Expanded(
                  //             child: ListView.builder(itemBuilder: (context, index) {
                  //               return GestureDetector(
                  //                   onTap: (){
                  //                     Navigator.push(context,
                  //                         MaterialPageRoute(
                  //                           builder: (context) =>
                  //                               MatchDetails(
                  //                                 false,
                  //                                 "",
                  //                                 "",
                  //                                 "",
                  //                                 "",
                  //                                 "",
                  //                                 "",
                  //                                 "",
                  //                                 "",
                  //                               ),
                  //                         )
                  //                     );
                  //                   },
                  //                   child: cardsBuilder(index));
                  //             },
                  //               itemExtent: 80,
                  //               itemCount: 3,
                  //               physics: const NeverScrollableScrollPhysics(),
                  //             )
                  //         ),
                  //       ],
                  //     )
                  // ),
                  // SizedBox(
                  //     width: mediaQuery.size.width,
                  //     height: mediaQuery.size.height*0.38,
                  //     child: Column(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         const ListTile(
                  //           title: Text("Tomorrow", style: TextStyle(fontSize: 18, color: Colors.white),),
                  //           dense: true,
                  //         ),
                  //         Expanded(
                  //             child: ListView.builder(itemBuilder: (context, index) {
                  //               return GestureDetector(
                  //                   onTap: (){
                  //                     Navigator.push(context,
                  //                         MaterialPageRoute(
                  //                           builder: (context) =>
                  //                               MatchDetails(
                  //                                 false,
                  //                                 "",
                  //                                 "",
                  //                                 "",
                  //                                 "",
                  //                                 "",
                  //                                 "",
                  //                                 "",
                  //                                 ""
                  //                               ),
                  //                         )
                  //                     );
                  //                   },
                  //                   child: cardsBuilder(index));
                  //             },
                  //               itemExtent: 80,
                  //               itemCount: 3,
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
      ),
    );
  }

  Widget cardsBuilder(
      String team1,
      String team2,
      String team1Score,
      String team2Score,
      String time,
      String status
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
                  Text(DateFormat("HH:mm a").format(DateTime.parse(time)), style: const TextStyle(color: Color(0xff9B8BFF)),),
                  selection==0?Text(status, style: const TextStyle(color: Color(0xff9B8BFF)),): const SizedBox()
                ],
              ),
              const SizedBox(width: 6,),
              Container(
                height: 50,
                width: 1,
                color: Colors.grey.shade600,
              )
            ],
          ),
        ),
        minLeadingWidth: 60,
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
              const Icon(Icons.notifications, color: Color(0xff9B8BFF),)
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
