import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:live_score_app/Screens/ModelClasses/SubstitudesModel.dart';
import '../../../../../../Widgets/GroundPlayerItems.dart';

class F_LineUps extends StatelessWidget {
  bool isShowGround;
  String fixtureId;
  F_LineUps({super.key, required this.isShowGround, required this.fixtureId});

  List<Substitute> substitutes1List = [];

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return FutureBuilder(
        future: lineUpsInformation(),
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

            if(response != null && response is List && response.isNotEmpty){

              var team1Substitudes = response[0]["substitutes"];
              var team2Substitudes = response[1]["substitutes"];

              for(var totalData in team1Substitudes) {
                substitutes1List.add(
                  Substitute(
                    totalData["player"]["name"].toString(),
                    totalData["player"]["number"].toString(),
                    totalData["player"]["pos"].toString(),
                  ),
                );
              }

              for(var totalData in team2Substitudes) {
                substitutes1List.add(
                  Substitute(
                    totalData["player"]["name"].toString(),
                    totalData["player"]["number"].toString(),
                    totalData["player"]["pos"].toString(),
                  ),
                );
              }

              return SingleChildScrollView(
                child: SizedBox(
                  height: isShowGround?mediaQuery.size.height*1.85:mediaQuery.size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      isShowGround?Container(
                        height: mediaQuery.size.height*0.85,
                        width: mediaQuery.size.width,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5
                        ),
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/ground.png"),
                                fit: BoxFit.fill
                            )
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                                top: mediaQuery.size.height*0.035,
                                right: 0,
                                left: 0,
                                child: GroundPlayerItems(
                                  value: int.parse(substitutes1List[0].playerNumber.toString()),
                                  name: substitutes1List[0].playerName.toString(),
                                  shirt: "assets/images/white_group.png",
                                  isWhite: false,
                                )
                            ),
                            Positioned(
                                top: mediaQuery.size.height*0.12,
                                left: mediaQuery.size.width*0.1,
                                child: GroundPlayerItems(
                                  value: int.parse(substitutes1List[1].playerNumber.toString()),
                                  name: substitutes1List[1].playerName.toString(),
                                  shirt: "assets/images/group.png",
                                  isWhite: true,
                                )
                            ),
                            Positioned(
                                top: mediaQuery.size.height*0.12,
                                left: mediaQuery.size.width*0.3,
                                child: GroundPlayerItems(
                                  value: int.parse(substitutes1List[2].playerNumber.toString()),
                                  name: substitutes1List[2].playerName.toString(),
                                  shirt: "assets/images/group.png",
                                  isWhite: true,
                                )
                            ),
                            Positioned(
                                top: mediaQuery.size.height*0.12,
                                right: mediaQuery.size.width*0.1,
                                child: GroundPlayerItems(
                                  value: int.parse(substitutes1List[3].playerNumber.toString()),
                                  name: substitutes1List[3].playerName.toString(),
                                  shirt: "assets/images/group.png",
                                  isWhite: true,
                                )
                            ),
                            Positioned(
                                top: mediaQuery.size.height*0.12,
                                right: mediaQuery.size.width*0.3,
                                child: GroundPlayerItems(
                                  value: int.parse(substitutes1List[4].playerNumber.toString()),
                                  name: substitutes1List[4].playerName.toString(),
                                  shirt: "assets/images/group.png",
                                  isWhite: true,
                                )
                            ),
                            Positioned(
                                top: mediaQuery.size.height*0.24,
                                left: mediaQuery.size.width*0.18,
                                child: GroundPlayerItems(
                                  value: int.parse(substitutes1List[5].playerNumber.toString()),
                                  name: substitutes1List[5].playerName.toString(),
                                  shirt: "assets/images/group.png",
                                  isWhite: true,
                                )
                            ),
                            Positioned(
                                top: mediaQuery.size.height*0.24,
                                left: mediaQuery.size.width*0.4,
                                child: GroundPlayerItems(
                                  value: int.parse(substitutes1List[6].playerNumber.toString()),
                                  name: substitutes1List[6].playerName.toString(),
                                  shirt: "assets/images/group.png",
                                  isWhite: true,
                                )
                            ),
                            Positioned(
                                top: mediaQuery.size.height*0.24,
                                left: mediaQuery.size.width*0.65,
                                child: GroundPlayerItems(
                                  value: int.parse(substitutes1List[7].playerNumber.toString()),
                                  name: substitutes1List[7].playerName.toString(),
                                  shirt: "assets/images/group.png",
                                  isWhite: true,
                                )
                            ),
                            Positioned(
                                top: mediaQuery.size.height*0.33,
                                right: mediaQuery.size.width*0.12,
                                child: GroundPlayerItems(
                                  value: int.parse(substitutes1List[8].playerNumber.toString()),
                                  name: substitutes1List[8].playerName.toString(),
                                  shirt: "assets/images/group.png",
                                  isWhite: true,
                                )
                            ),
                            Positioned(
                                top: mediaQuery.size.height*0.33,
                                right: 0,
                                left: 0,
                                child: GroundPlayerItems(
                                  value: int.parse(substitutes1List[8].playerNumber.toString()),
                                  name: substitutes1List[8].playerName.toString(),
                                  shirt: "assets/images/group.png",
                                  isWhite: true,
                                )
                            ),
                            Positioned(
                                top: mediaQuery.size.height*0.33,
                                left: mediaQuery.size.width*0.12,
                                child: GroundPlayerItems(
                                  value: int.parse(substitutes1List[5].playerNumber.toString()),
                                  name: substitutes1List[5].playerName.toString(),
                                  shirt: "assets/images/group.png",
                                  isWhite: true,
                                )
                            ),
                            Positioned(
                              top: mediaQuery.size.height*0.37,
                              right: mediaQuery.size.width*0.38,
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    image: const DecorationImage(
                                        image: AssetImage("assets/images/bootball.png"),
                                        fit: BoxFit.fill
                                    )
                                ),
                              ),
                            ),
                            Positioned(
                              top: mediaQuery.size.height*0.37,
                              right: mediaQuery.size.width*0.34,
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    image: const DecorationImage(
                                        image: AssetImage("assets/images/bootball.png"),
                                        fit: BoxFit.fill
                                    )
                                ),
                              ),
                            ),
                            Positioned(
                                bottom: mediaQuery.size.height*0.03,
                                right: 0,
                                left: 0,
                                child: GroundPlayerItems(
                                  value: int.parse(substitutes1List[9].playerNumber.toString()),
                                  name: substitutes1List[9].playerName.toString(),
                                  shirt: "assets/images/white_group.png",
                                  isWhite: false,
                                )
                            ),

                            Positioned(
                                bottom: mediaQuery.size.height*0.12,
                                left: mediaQuery.size.width*0.1,
                                child: GroundPlayerItems(
                                  value: int.parse(substitutes1List[10].playerNumber.toString()),
                                  name: substitutes1List[10].playerName.toString(),
                                  shirt: "assets/images/red_group.png",
                                  isWhite: true,
                                )
                            ),
                            Positioned(
                                bottom: mediaQuery.size.height*0.12,
                                left: mediaQuery.size.width*0.3,
                                child: GroundPlayerItems(
                                  value: int.parse(substitutes1List[11].playerNumber.toString()),
                                  name: substitutes1List[11].playerName.toString(),
                                  shirt: "assets/images/red_group.png",
                                  isWhite: true,
                                )
                            ),
                            Positioned(
                                bottom: mediaQuery.size.height*0.12,
                                right: mediaQuery.size.width*0.1,
                                child: GroundPlayerItems(
                                  value: int.parse(substitutes1List[12].playerNumber.toString()),
                                  name: substitutes1List[12].playerName.toString(),
                                  shirt: "assets/images/red_group.png",
                                  isWhite: true,
                                )
                            ),
                            Positioned(
                                bottom: mediaQuery.size.height*0.12,
                                right: mediaQuery.size.width*0.3,
                                child: GroundPlayerItems(
                                  value: int.parse(substitutes1List[13].playerNumber.toString()),
                                  name: substitutes1List[13].playerName.toString(),
                                  shirt: "assets/images/red_group.png",
                                  isWhite: true,
                                )
                            ),

                            Positioned(
                                bottom: mediaQuery.size.height*0.24,
                                left: mediaQuery.size.width*0.18,
                                child: GroundPlayerItems(
                                  value: int.parse(substitutes1List[14].playerNumber.toString()),
                                  name: substitutes1List[14].playerName.toString(),
                                  shirt: "assets/images/red_group.png",
                                  isWhite: true,
                                )
                            ),
                            Positioned(
                                bottom: mediaQuery.size.height*0.24,
                                left: mediaQuery.size.width*0.4,
                                child: GroundPlayerItems(
                                  value: int.parse(substitutes1List[15].playerNumber.toString()),
                                  name: substitutes1List[15].playerName.toString(),
                                  shirt: "assets/images/red_group.png",
                                  isWhite: true,
                                )
                            ),
                            Positioned(
                                bottom: mediaQuery.size.height*0.24,
                                left: mediaQuery.size.width*0.65,
                                child: GroundPlayerItems(
                                  value: int.parse(substitutes1List[16].playerNumber.toString()),
                                  name: substitutes1List[16].playerName.toString(),
                                  shirt: "assets/images/red_group.png",
                                  isWhite: true,
                                )
                            ),

                            Positioned(
                                bottom: mediaQuery.size.height*0.33,
                                right: mediaQuery.size.width*0.12,
                                child: GroundPlayerItems(
                                  value: int.parse(substitutes1List[17].playerNumber.toString()),
                                  name: substitutes1List[17].playerName.toString(),
                                  shirt: "assets/images/red_group.png",
                                  isWhite: true,
                                )
                            ),
                            Positioned(
                                bottom: mediaQuery.size.height*0.33,
                                right: 0,
                                left: 0,
                                child: GroundPlayerItems(
                                  value: int.parse(substitutes1List[3].playerNumber.toString()),
                                  name: substitutes1List[3].playerName.toString(),
                                  shirt: "assets/images/red_group.png",
                                  isWhite: true,
                                )
                            ),
                            Positioned(
                                bottom: mediaQuery.size.height*0.33,
                                left: mediaQuery.size.width*0.12,
                                child: GroundPlayerItems(
                                  value: int.parse(substitutes1List[1].playerNumber.toString()),
                                  name: substitutes1List[1].playerName.toString(),
                                  shirt: "assets/images/red_group.png",
                                  isWhite: true,
                                )
                            ),

                          ],
                        ),
                      ):const SizedBox(),
                      Container(
                        height: mediaQuery.size.height,
                        width: mediaQuery.size.width,
                        padding: const EdgeInsets.symmetric(
                            vertical: 30,
                            horizontal: 10
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Substitutes",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white
                              ),
                            ),
                            Expanded(
                              child: GridView.builder(
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisExtent: 45
                                ),
                                itemBuilder: (context, index) {
                                  return lineUpListBuilder(
                                      substitutes1List[index].playerName.toString(),
                                      substitutes1List[index].playerNumber.toString()
                                  );
                                },
                                itemCount: substitutes1List.length,
                                physics: const NeverScrollableScrollPhysics(),
                              ),
                            )
                          ],
                        ),
                      ),
                      // Container(
                      //   height: mediaQuery.size.height*0.42,
                      //   width: mediaQuery.size.width,
                      //   padding: const EdgeInsets.symmetric(
                      //       vertical: 15,
                      //       horizontal: 10
                      //   ),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       const Text("Injuries",
                      //         style: TextStyle(
                      //             fontSize: 18,
                      //             fontWeight: FontWeight.w600,
                      //             color: Colors.white
                      //         ),
                      //       ),
                      //       Expanded(
                      //         child: GridView.builder(
                      //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      //               crossAxisCount: 2,
                      //               mainAxisExtent: 45
                      //           ),
                      //           itemBuilder: (context, index) {
                      //             return lineUpListBuilder(
                      //                 substitutes1List[index].playerName.toString(),
                      //                 substitutes1List[index].playerNumber.toString());
                      //           },
                      //           itemCount: substitutes1List.length,
                      //           physics: const NeverScrollableScrollPhysics(),
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              );
            }
            else{
              return Container(
                margin: EdgeInsets.only(
                    left: mediaQuery.size.width*0.28,
                    top: mediaQuery.size.height*0.2
                ),
                child: const Text(
                  "No data found yet.",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              );
            }
          }
          else {
            return const Text("Sorry Their is an Server Issue Occurring",
              style: TextStyle(fontSize: 12, color: Colors.white),
            );
          }
        },
    );
  }

  Widget lineUpListBuilder(String name, String number){

    return ListTile(
      minLeadingWidth: 15,
      horizontalTitleGap: 8,
      dense: true,
      // dense: true,
      leading: Text(number, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Colors.white),),
      title: Text(name, style: TextStyle(fontSize: 10,color: Colors.white),),
    );
  }

  Widget injuriesLineUpListBuilder(String name, String flag){
    return ListTile(
      minLeadingWidth: 15,
      horizontalTitleGap: 8,
      dense: true,
      // dense: true,
      leading: Container(
        height: 20,
        width: 30,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                flag
              )
          )
        ),
      ),
      title: Text(name, style: const TextStyle(fontSize: 10,color: Colors.white),),
    );
  }

  Future lineUpsInformation() async{

    const String apiKey = "0a9ce6deb596f61f4e33463c192bd31c";

    var headers = {
      'x-rapidapi-key': apiKey,
      'x-rapidapi-host': 'https://api-football-v1.p.rapidapi.com/v3/fixtures/lineups'
    };
    var request = http.Request(
        'GET',
        Uri.parse('https://v3.football.api-sports.io/fixtures/lineups?fixture=${fixtureId.toString()}')
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
