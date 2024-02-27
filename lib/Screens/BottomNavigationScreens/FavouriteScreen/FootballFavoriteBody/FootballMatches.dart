import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../DashBoards/MatchesDetailed/MatchDetailes.dart';
import '../../DashBoards/MatchesOverviewTabBars/MatchesOverviewTabBars.dart';

class FootballMatches extends StatelessWidget {
  FootballMatches({super.key});

  Query database = FirebaseDatabase.instance.ref("1");

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return StreamBuilder(
        stream: FirebaseDatabase.instance.ref("1").onValue,
        builder: (context,AsyncSnapshot<DatabaseEvent> data) {
          if(data.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
                backgroundColor: Colors.grey,
              ),
            );
          }
          else if(data.hasData) {

            Map<dynamic, dynamic> map = data.data!.snapshot.value as dynamic;

            List<dynamic> list = [];

            list.clear();

            list = map.values.toList();

            return FutureBuilder(
              future: favouriteFixtureInformation(list[1]["League1ID"].toString()),
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

                      SizedBox(
                        height: mediaQuery.size.height,
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
                                                isFootball: true,
                                                logo: response[index]["league"]["logo"].toString(),
                                                country: response[index]["country"]["name"].toString(),
                                                name: response[index]["league"]["name"].toString(),
                                                leagueID: response[index]["league"]["id"].toString(),
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
                                  ),
                                  ),
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
            );
          }
          else {
            return const Text("Sorry Their is an Server Issue Occurring",
              style: TextStyle(fontSize: 12, color: Colors.white),
            );
          }
        }
    );
  }

  Future favouriteFixtureInformation(String leagueID) async{

    const String apiKey = "0a9ce6deb596f61f4e33463c192bd31c";

    var headers = {
      'x-rapidapi-key': apiKey,
      'x-rapidapi-host': 'https://api-football-v1.p.rapidapi.com/v3/fixtures'
    };
    var request = http.Request(
        'GET',
        Uri.parse('https://v3.football.api-sports.io/fixtures?league=$leagueID&season=2023')
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
