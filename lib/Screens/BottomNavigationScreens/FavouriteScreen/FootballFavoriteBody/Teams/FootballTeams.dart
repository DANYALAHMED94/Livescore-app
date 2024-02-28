import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'TeamInfo/TeamInfoMainScreen.dart';

class FootballTeams extends StatelessWidget {

  FootballTeams({super.key});

  List<dynamic> list = [];

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

            list.clear();

            list = map.values.toList();

            return FutureBuilder(
              future: teamInformation(list[1]["League1ID"].toString()),
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

                  return Column(
                    children: [
                      ListTile(
                        horizontalTitleGap: 20,
                        dense: true,
                        title: Text("Following & Suggested", style: TextStyle(color: Colors.grey.shade400,
                        ),),
                      ),

                      SizedBox(
                        height: mediaQuery.size.height*0.65,
                        child: ListView.builder(itemBuilder: (context, index) {
                          if (response[index]["team"]["id"].toString().contains(list[0]["team${index+1}ID"].toString()))
                          {
                            return GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => TeamInfoMainScreen(
                                    response[index]["team"]["id"].toString(),
                                    response[index]["team"]["name"].toString(),
                                    response[index]["team"]["logo"].toString(),
                                    response[index]["country"]["name"].toString()
                                ),
                                )
                                );
                              },
                              child: Container(
                                width: mediaQuery.size.width,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 5
                                ),
                                decoration: BoxDecoration(
                                    color: const Color(0xff161616),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Center(
                                  child: ListTile(
                                      dense: true,
                                      leading: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    response[index]["team"]["logo"].toString()
                                                ),
                                                fit: BoxFit.fill
                                            )
                                        ),
                                      ),
                                      minLeadingWidth: 20,
                                      title: Text(response[index]["team"]["name"].toString(), style: TextStyle(color: Colors.white),),
                                      trailing: Icon(Icons.notifications_active, color: const Color(0xff9B8BFF),)
                                  ),
                                ),
                              ),
                            );
                          }
                          else{
                            return GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => TeamInfoMainScreen(
                                    response[index]["team"]["id"].toString(),
                                    response[index]["team"]["name"].toString(),
                                    response[index]["team"]["logo"].toString(),
                                    response[index]["country"]["name"].toString()
                                ),
                                )
                                );
                              },
                              child: Container(
                                width: mediaQuery.size.width,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 5
                                ),
                                decoration: BoxDecoration(
                                    color: const Color(0xff161616),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Center(
                                  child: ListTile(
                                      dense: true,
                                      leading: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    response[index]["team"]["logo"].toString()
                                                ),
                                                fit: BoxFit.fill
                                            )
                                        ),
                                      ),
                                      minLeadingWidth: 20,
                                      title: Text(response[index]["team"]["name"].toString(), style: TextStyle(color: Colors.white),),
                                      trailing: const Icon(Icons.notifications_outlined, color: const Color(0xff9B8BFF),)
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                          scrollDirection: Axis.vertical,
                          itemExtent: 65,
                          itemCount: response.length,
                          physics: const BouncingScrollPhysics(),
                        ),
                      ),

                      // ListTile(
                      //   horizontalTitleGap: 20,
                      //   dense: true,
                      //   title: Text("Suggested", style: TextStyle(color: Colors.grey.shade400,
                      //   ),),
                      // ),

                      // SizedBox(
                      //   height: mediaQuery.size.height*0.35,
                      //   child: GestureDetector(
                      //     onTap: (){
                      //       Navigator.push(context, MaterialPageRoute(builder: (context) => TeamInfoMainScreen(
                      //           "",
                      //           "",
                      //           "",
                      //           ""
                      //       ),));
                      //     },
                      //     child: ListView.builder(itemBuilder: (context, index) {
                      //       if (list[0].toString().contains(response[index]["team"]["id"].toString()))
                      //       {
                      //         return const SizedBox();
                      //       }
                      //       else {
                      //         return GestureDetector(
                      //           onTap: (){
                      //             Navigator.push(context, MaterialPageRoute(builder: (context) => TeamInfoMainScreen(
                      //                 "",
                      //                 "",
                      //                 "",
                      //                 ""
                      //             ),
                      //             )
                      //             );
                      //           },
                      //           child: Container(
                      //             width: mediaQuery.size.width,
                      //             margin: const EdgeInsets.symmetric(
                      //                 horizontal: 20,
                      //                 vertical: 5
                      //             ),
                      //             decoration: BoxDecoration(
                      //                 color: const Color(0xff161616),
                      //                 borderRadius: BorderRadius.circular(10)
                      //             ),
                      //             child: Center(
                      //               child: ListTile(
                      //                   dense: true,
                      //                   leading: Container(
                      //                     height: 40,
                      //                     width: 40,
                      //                     decoration: BoxDecoration(
                      //                         image: DecorationImage(
                      //                             image: NetworkImage(
                      //                                 response[index]["team"]["logo"].toString()
                      //                             ),
                      //                             fit: BoxFit.fill
                      //                         )
                      //                     ),
                      //                   ),
                      //                   minLeadingWidth: 20,
                      //                   title: Text(response[index]["team"]["name"].toString(), style: TextStyle(color: Colors.white),),
                      //                   trailing: Icon(Icons.notifications, color: const Color(0xff9B8BFF),)
                      //               ),
                      //             ),
                      //           ),
                      //         );
                      //       }
                      //     },
                      //       scrollDirection: Axis.vertical,
                      //       itemExtent: 65,
                      //       itemCount: response.length,
                      //       physics: BouncingScrollPhysics(),
                      //     ),
                      //   ),
                      // )

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

  Future teamInformation(String leagueID) async{

    const String apiKey = "0a9ce6deb596f61f4e33463c192bd31c";

    var headers = {
      'x-rapidapi-key': apiKey,
      'x-rapidapi-host': 'https://api-football-v1.p.rapidapi.com/v3/teams'
    };
    var request = http.Request(
        'GET',
        Uri.parse('https://v3.football.api-sports.io/teams?league=39&season=2023')
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
