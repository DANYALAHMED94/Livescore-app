import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../../../ModelClasses/SquadModel.dart';
import 'PlayersProfileScreen/PlayerProfileMainScreen.dart';

class SquadTeamInfo extends StatelessWidget {
  String teamID, teamName, teamLogo;

  SquadTeamInfo(this.teamID, this.teamName, this.teamLogo);

  List<SquadModel> squadList = [];

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15
      ),
      child: SizedBox(
        height: mediaQuery.size.height*2.3,
        width: mediaQuery.size.width,
        // color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                // Container(
                //   height: 40,
                //   width: mediaQuery.size.width,
                //   decoration: const BoxDecoration(
                //       border: Border(
                //         top: BorderSide(
                //             color: Colors.grey,
                //             width: 0.5,
                //             style: BorderStyle.solid
                //         ),
                //         bottom: BorderSide(
                //             color: Colors.grey,
                //             width: 0.5,
                //             style: BorderStyle.solid
                //         ),
                //
                //       )
                //   ),
                //   child: Padding(
                //     padding: EdgeInsets.symmetric(
                //         horizontal: 20,
                //         vertical: 8
                //     ),
                //     child: Text("GoalKeeper", style: TextStyle(color: Colors.white, fontSize: 15),),
                //   ),
                // ),

                FutureBuilder(
                    future: squadInformation(),
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
                        var response = mapData["response"][0]["players"];

                        for (var playersInfo in response) {
                          squadList.add(
                            SquadModel(
                                playersInfo["id"].toString(),
                                playersInfo["name"].toString(),
                                playersInfo["photo"].toString(),
                                playersInfo["age"].toString(),
                                playersInfo["number"].toString(),
                                playersInfo["position"].toString(),
                            )
                          );
                        }

                        return SizedBox(
                          height: mediaQuery.size.height*0.7,
                          child: ListView.separated(itemBuilder: (context, index) {
                            return ListTile(
                              onTap: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => PlayerProfileMainScreen(
                                      squadList[index].name.toString(),
                                      squadList[index].id.toString(),
                                      squadList[index].age.toString(),
                                      squadList[index].number.toString(),
                                      squadList[index].photo.toString(),
                                      teamLogo.toString(),
                                      teamID.toString(),
                                      teamName.toString()
                                    ),
                                    )
                                );
                              },
                              trailing: Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    image: const DecorationImage(
                                        image: AssetImage("assets/images/group.png")),
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                child: Center(
                                  child: Text(squadList[index].age.toString(), style: TextStyle(fontSize: 12, color: Colors.white),),
                                ),
                              ),
                              title: SizedBox(
                                width: mediaQuery.size.width*0.5,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text("${squadList[index].name.toString()}\t"
                                          "(${squadList[index].position.toString()})",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(color: Colors.white, fontSize: 12),),
                                    ),
                                    // Container(
                                    //   height: 20,
                                    //   width: 30,
                                    //   margin: const EdgeInsets.symmetric(
                                    //       horizontal: 2,
                                    //       vertical: 3
                                    //   ),
                                    //   decoration: BoxDecoration(
                                    //       color: Colors.grey.shade300,
                                    //       image: DecorationImage(
                                    //           image: AssetImage("assets/images/spain.png"),
                                    //           fit: BoxFit.cover
                                    //       ),
                                    //       borderRadius: BorderRadius.circular(5)
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                              dense: true,
                              leading: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            squadList[index].photo.toString()
                                        ),
                                        fit: BoxFit.cover
                                    ),
                                    borderRadius: BorderRadius.circular(8)
                                ),
                              ),
                            );
                          }, separatorBuilder: (context, index) {
                            return Divider(color: Colors.grey, thickness: 0.5,);
                          },
                              physics: BouncingScrollPhysics(),
                              itemCount: squadList.length
                          ),
                        );
                      }
                      else{
                        return const Text("Sorry Their is an Server Issue Occurring",
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        );
                      }
                    },
                )
              ],
            ),


            // Column(
            //   children: [
            //     Container(
            //       height: 40,
            //       width: mediaQuery.size.width,
            //       decoration: const BoxDecoration(
            //           border: Border(
            //             top: BorderSide(
            //                 color: Colors.grey,
            //                 width: 0.5,
            //                 style: BorderStyle.solid
            //             ),
            //             bottom: BorderSide(
            //                 color: Colors.grey,
            //                 width: 0.5,
            //                 style: BorderStyle.solid
            //             ),
            //
            //           )
            //       ),
            //       child: Padding(
            //         padding: EdgeInsets.symmetric(
            //             horizontal: 20,
            //             vertical: 8
            //         ),
            //         child: Text("Defenders", style: TextStyle(color: Colors.white, fontSize: 15),),
            //       ),
            //     ),
            //     SizedBox(
            //       height: mediaQuery.size.height*0.58,
            //       child: ListView.separated(itemBuilder: (context, index) {
            //         return ListTile(
            //           onTap: (){
            //             Navigator.push(context,
            //                 MaterialPageRoute(builder: (context) =>
            //                 const PlayerProfileMainScreen(),));
            //           },
            //           trailing: Container(
            //             height: 35,
            //             width: 35,
            //             decoration: BoxDecoration(
            //                 color: Colors.transparent,
            //                 image: const DecorationImage(
            //                     image: AssetImage("assets/images/group.png")),
            //                 borderRadius: BorderRadius.circular(8)
            //             ),
            //             child: const Center(
            //               child: Text("9", style: TextStyle(fontSize: 12, color: Colors.white),),
            //             ),
            //           ),
            //           title: SizedBox(
            //             width: mediaQuery.size.width*0.5,
            //             child: Row(
            //               children: [
            //                 Text("Robert Lewandowwski\t",
            //                   softWrap: true,
            //                   maxLines: 1,
            //                   overflow: TextOverflow.ellipsis,
            //                   style: TextStyle(color: Colors.white, fontSize: 12),),
            //                 Container(
            //                   height: 20,
            //                   width: 30,
            //                   margin: const EdgeInsets.symmetric(
            //                       horizontal: 2,
            //                       vertical: 3
            //                   ),
            //                   decoration: BoxDecoration(
            //                       color: Colors.grey.shade300,
            //                       image: DecorationImage(
            //                           image: AssetImage("assets/images/spain.png"),
            //                           fit: BoxFit.cover
            //                       ),
            //                       borderRadius: BorderRadius.circular(5)
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //           dense: true,
            //           leading: Container(
            //             height: 40,
            //             width: 40,
            //             decoration: BoxDecoration(
            //                 color: Colors.grey.shade300,
            //                 image: DecorationImage(
            //                     image: AssetImage("assets/images/player.png"),
            //                     fit: BoxFit.cover
            //                 ),
            //                 borderRadius: BorderRadius.circular(8)
            //             ),
            //           ),
            //         );;
            //       }, separatorBuilder: (context, index) {
            //         return Divider(color: Colors.grey, thickness: 0.5,);
            //       },
            //           physics: NeverScrollableScrollPhysics(),
            //           itemCount: 7),
            //     )
            //   ],
            // ),
            //
            // Column(
            //   children: [
            //     Container(
            //       height: 40,
            //       width: mediaQuery.size.width,
            //       decoration: const BoxDecoration(
            //           border: Border(
            //             top: BorderSide(
            //                 color: Colors.grey,
            //                 width: 0.5,
            //                 style: BorderStyle.solid
            //             ),
            //             bottom: BorderSide(
            //                 color: Colors.grey,
            //                 width: 0.5,
            //                 style: BorderStyle.solid
            //             ),
            //
            //           )
            //       ),
            //       child: Padding(
            //         padding: EdgeInsets.symmetric(
            //             horizontal: 20,
            //             vertical: 8
            //         ),
            //         child: Text("MidFeilders", style: TextStyle(color: Colors.white, fontSize: 15),),
            //       ),
            //     ),
            //     SizedBox(
            //       height: mediaQuery.size.height*0.58,
            //       child: ListView.separated(itemBuilder: (context, index) {
            //         return ListTile(
            //           onTap: (){
            //             Navigator.push(context,
            //                 MaterialPageRoute(builder: (context) =>
            //                 const PlayerProfileMainScreen(),));
            //           },
            //           trailing: Container(
            //             height: 35,
            //             width: 35,
            //             decoration: BoxDecoration(
            //                 color: Colors.transparent,
            //                 image: const DecorationImage(
            //                     image: AssetImage("assets/images/group.png")),
            //                 borderRadius: BorderRadius.circular(8)
            //             ),
            //             child: const Center(
            //               child: Text("9", style: TextStyle(fontSize: 12, color: Colors.white),),
            //             ),
            //           ),
            //           title: SizedBox(
            //             width: mediaQuery.size.width*0.5,
            //             child: Row(
            //               children: [
            //                 Text("Robert Lewandowwski\t",
            //                   softWrap: true,
            //                   maxLines: 1,
            //                   overflow: TextOverflow.ellipsis,
            //                   style: TextStyle(color: Colors.white, fontSize: 12),),
            //                 Container(
            //                   height: 20,
            //                   width: 30,
            //                   margin: const EdgeInsets.symmetric(
            //                       horizontal: 2,
            //                       vertical: 3
            //                   ),
            //                   decoration: BoxDecoration(
            //                       color: Colors.grey.shade300,
            //                       image: DecorationImage(
            //                           image: AssetImage("assets/images/spain.png"),
            //                           fit: BoxFit.cover
            //                       ),
            //                       borderRadius: BorderRadius.circular(5)
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //           dense: true,
            //           leading: Container(
            //             height: 40,
            //             width: 40,
            //             decoration: BoxDecoration(
            //                 color: Colors.grey.shade300,
            //                 image: DecorationImage(
            //                     image: AssetImage("assets/images/player.png"),
            //                     fit: BoxFit.cover
            //                 ),
            //                 borderRadius: BorderRadius.circular(8)
            //             ),
            //           ),
            //         );
            //       }, separatorBuilder: (context, index) {
            //         return Divider(color: Colors.grey, thickness: 0.5,);
            //       },
            //           physics: NeverScrollableScrollPhysics(),
            //           itemCount: 7),
            //     )
            //   ],
            // ),
            //
            //
            // Column(
            //   children: [
            //     Container(
            //       height: 40,
            //       width: mediaQuery.size.width,
            //       decoration: const BoxDecoration(
            //           border: Border(
            //             top: BorderSide(
            //                 color: Colors.grey,
            //                 width: 0.5,
            //                 style: BorderStyle.solid
            //             ),
            //             bottom: BorderSide(
            //                 color: Colors.grey,
            //                 width: 0.5,
            //                 style: BorderStyle.solid
            //             ),
            //
            //           )
            //       ),
            //       child: Padding(
            //         padding: EdgeInsets.symmetric(
            //             horizontal: 20,
            //             vertical: 8
            //         ),
            //         child: Text("Forwards", style: TextStyle(color: Colors.white, fontSize: 15),),
            //       ),
            //     ),
            //     SizedBox(
            //       height: mediaQuery.size.height*0.58,
            //       child: ListView.separated(itemBuilder: (context, index) {
            //         return ListTile(
            //           onTap: (){
            //             Navigator.push(context,
            //                 MaterialPageRoute(builder: (context) =>
            //                 const PlayerProfileMainScreen(),));
            //           },
            //           trailing: Container(
            //             height: 35,
            //             width: 35,
            //             decoration: BoxDecoration(
            //                 color: Colors.transparent,
            //                 image: const DecorationImage(
            //                     image: AssetImage("assets/images/group.png")),
            //                 borderRadius: BorderRadius.circular(8)
            //             ),
            //             child: const Center(
            //               child: Text("9", style: TextStyle(fontSize: 12, color: Colors.white),),
            //             ),
            //           ),
            //           title: SizedBox(
            //             width: mediaQuery.size.width*0.5,
            //             child: Row(
            //               children: [
            //                 Text("Robert Lewandowwski\t",
            //                   softWrap: true,
            //                   maxLines: 1,
            //                   overflow: TextOverflow.ellipsis,
            //                   style: TextStyle(color: Colors.white, fontSize: 12),),
            //                 Container(
            //                   height: 20,
            //                   width: 30,
            //                   margin: const EdgeInsets.symmetric(
            //                       horizontal: 2,
            //                       vertical: 3
            //                   ),
            //                   decoration: BoxDecoration(
            //                       color: Colors.grey.shade300,
            //                       image: DecorationImage(
            //                           image: AssetImage("assets/images/spain.png"),
            //                           fit: BoxFit.cover
            //                       ),
            //                       borderRadius: BorderRadius.circular(5)
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //           dense: true,
            //           leading: Container(
            //             height: 40,
            //             width: 40,
            //             decoration: BoxDecoration(
            //                 color: Colors.grey.shade300,
            //                 image: DecorationImage(
            //                     image: AssetImage("assets/images/player.png"),
            //                     fit: BoxFit.cover
            //                 ),
            //                 borderRadius: BorderRadius.circular(8)
            //             ),
            //           ),
            //         );;
            //       }, separatorBuilder: (context, index) {
            //         return Divider(color: Colors.grey, thickness: 0.5,);
            //       },
            //           physics: NeverScrollableScrollPhysics(),
            //           itemCount: 7),
            //     )
            //   ],
            // ),
            //
            // Column(
            //   children: [
            //     Container(
            //       height: 40,
            //       width: mediaQuery.size.width,
            //       decoration: const BoxDecoration(
            //           border: Border(
            //             top: BorderSide(
            //                 color: Colors.grey,
            //                 width: 0.5,
            //                 style: BorderStyle.solid
            //             ),
            //             bottom: BorderSide(
            //                 color: Colors.grey,
            //                 width: 0.5,
            //                 style: BorderStyle.solid
            //             ),
            //
            //           )
            //       ),
            //       child: const Padding(
            //         padding: EdgeInsets.symmetric(
            //             horizontal: 20,
            //             vertical: 8
            //         ),
            //         child: Text("Coaches", style: TextStyle(color: Colors.white, fontSize: 15),),
            //       ),
            //     ),
            //     SizedBox(
            //       height: mediaQuery.size.height*0.08,
            //       child: ListView.separated(itemBuilder: (context, index) {
            //         return ListTile(
            //           onTap: (){
            //             Navigator.push(context,
            //                 MaterialPageRoute(builder: (context) =>
            //                 const PlayerProfileMainScreen(),));
            //           },
            //           trailing: Container(
            //             height: 35,
            //             width: 35,
            //             decoration: BoxDecoration(
            //                 color: Colors.transparent,
            //                 image: const DecorationImage(
            //                     image: AssetImage("assets/images/group.png")),
            //                 borderRadius: BorderRadius.circular(8)
            //             ),
            //             child: const Center(
            //               child: Text("9", style: TextStyle(fontSize: 12, color: Colors.white),),
            //             ),
            //           ),
            //           title: SizedBox(
            //             width: mediaQuery.size.width*0.5,
            //             child: Row(
            //               children: [
            //                 Text("Robert Lewandowwski\t",
            //                   softWrap: true,
            //                   maxLines: 1,
            //                   overflow: TextOverflow.ellipsis,
            //                   style: TextStyle(color: Colors.white, fontSize: 12),),
            //                 Container(
            //                   height: 20,
            //                   width: 30,
            //                   margin: const EdgeInsets.symmetric(
            //                       horizontal: 2,
            //                       vertical: 3
            //                   ),
            //                   decoration: BoxDecoration(
            //                       color: Colors.grey.shade300,
            //                       image: DecorationImage(
            //                           image: AssetImage("assets/images/spain.png"),
            //                           fit: BoxFit.cover
            //                       ),
            //                       borderRadius: BorderRadius.circular(5)
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //           dense: true,
            //           leading: Container(
            //             height: 40,
            //             width: 40,
            //             decoration: BoxDecoration(
            //                 color: Colors.grey.shade300,
            //                 image: DecorationImage(
            //                     image: AssetImage("assets/images/player.png"),
            //                     fit: BoxFit.cover
            //                 ),
            //                 borderRadius: BorderRadius.circular(8)
            //             ),
            //           ),
            //         );;
            //       }, separatorBuilder: (context, index) {
            //         return const Divider(color: Colors.grey, thickness: 0.5,);
            //       },
            //           physics: const NeverScrollableScrollPhysics(),
            //           itemCount: 7),
            //     )
            //   ],
            // )

          ],
        ),
      ),
    );
  }

  Future squadInformation() async{

    const String apiKey = "0a9ce6deb596f61f4e33463c192bd31c";

    var headers = {
      'x-rapidapi-key': apiKey,
      'x-rapidapi-host': 'https://api-football-v1.p.rapidapi.com/v3/teams'
    };
    var request = http.Request(
        'GET',
        Uri.parse('https://v3.football.api-sports.io/players/squads?team=$teamID')
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
