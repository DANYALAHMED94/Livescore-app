import 'dart:convert';

import 'package:flutter/material.dart';
import '../../../../../ModelClasses/SubstitudesModel.dart';
import '../../../../../ModelClasses/SummaryModel.dart';
import "package:http/http.dart" as http;

class F_Summary extends StatelessWidget {

  F_Summary({super.key});

  List<Substitute> injuriesList = [];

  //
  // List<SummaryModel> scoreList = [
  //   SummaryModel("1", "Yasir", "40"),
  //   SummaryModel("1", "Ali", "40"),
  //   SummaryModel("2", "Raza", "50"),
  //   SummaryModel("2", "Jafar", "60"),
  //   SummaryModel("1", "Bhola", "40"),
  // ];
  //
  // List<SummaryModel> scoreList2 = [
  //   SummaryModel("2", "Yasir", "40"),
  //   SummaryModel("2", "Ali", "40"),
  //   SummaryModel("2", "Raza", "50"),
  //   SummaryModel("2", "Jafar", "60"),
  //   SummaryModel("2", "Bhola", "40"),
  // ];



  @override
  Widget build(BuildContext context) {

    var mediaQuery = MediaQuery.of(context);

    return FutureBuilder(
      future: injuriesInformation(),
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


          for(var totalData in response) {
            injuriesList.add(
              Substitute(
                totalData["player"]["name"].toString(),
                totalData["player"]["id"].toString(),
                totalData["player"]["reason"].toString(),
              ),
            );
          }

          return SingleChildScrollView(
            child: SizedBox(
                height: mediaQuery.size.height*1.26,
                width: mediaQuery.size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10
                      ),
                      height: mediaQuery.size.height*0.65,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              width: mediaQuery.size.width,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  // vertical: 8
                              ),
                              margin: const EdgeInsets.symmetric(
                                  vertical: 5
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  SizedBox(
                                    width: mediaQuery.size.width*0.25,
                                      child: Text(
                                        injuriesList[index].playerNumber.toString(),
                                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                                      )
                                  ),
                                  SizedBox(
                                      width: mediaQuery.size.width*0.25,
                                      child: Text(
                                        injuriesList[index].playerName.toString(),
                                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                                      )
                                  ),
                                  SizedBox(
                                      width: mediaQuery.size.width*0.25,
                                      child: Text(
                                        injuriesList[index].playerPosition.toString(),
                                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                                      )
                                  ),
                                  // SizedBox(
                                  //     width: mediaQuery.size.width*0.25,
                                  //     child: scoreList[index].team=="1"
                                  //         ?Text(scoreList[index].name, textAlign: TextAlign.center,
                                  //       softWrap: true,
                                  //       overflow: TextOverflow.ellipsis,
                                  //       style: TextStyle(color: Colors.white),)
                                  //         :SizedBox()
                                  // ),
                                  // SizedBox(
                                  //   width: mediaQuery.size.width*0.25,
                                  //   child: Text(scoreList[index].score, textAlign: TextAlign.center,
                                  //     softWrap: true,
                                  //     overflow: TextOverflow.ellipsis,
                                  //     style: TextStyle(color: Colors.white),),
                                  // ),
                                  // SizedBox(
                                  //     width: mediaQuery.size.width*0.25,
                                  //     child: scoreList[index].team=="2"
                                  //         ?Text(scoreList[index].name, textAlign: TextAlign.center,
                                  //       softWrap: true,
                                  //       overflow: TextOverflow.ellipsis,
                                  //       style: TextStyle(color: Colors.white),)
                                  //         :SizedBox()
                                  // )
                                ],
                              )
                          );
                        },
                        itemCount: injuriesList.length,
                        physics: BouncingScrollPhysics(),
                      ),
                    ),

                    // Container(
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 25
                    //   ),
                    //   child: Row(
                    //     children: [
                    //       SizedBox(
                    //         width: mediaQuery.size.width*0.33,
                    //         child: const Divider(
                    //           color: Colors.white,
                    //           thickness: 0.5,
                    //         ),
                    //       ),
                    //       Container(
                    //         height: 50,
                    //         width: 50,
                    //         margin: const EdgeInsets.symmetric(
                    //             horizontal: 10
                    //         ),
                    //         decoration: BoxDecoration(
                    //             color: Colors.black,
                    //             borderRadius: BorderRadius.circular(10)
                    //         ),
                    //         child: const Center(
                    //           child: Text("HT", style: TextStyle(color: Colors.white),),
                    //         ),
                    //       ),
                    //       SizedBox(
                    //         width: mediaQuery.size.width*0.33,
                    //         child: const Divider(
                    //           color: Colors.white,
                    //           thickness: 0.5,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    //
                    // Container(
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 15,
                    //       vertical: 10
                    //   ),
                    //   height: mediaQuery.size.height*0.35,
                    //   child: ListView.builder(itemBuilder: (context, index) {
                    //     return Container(
                    //         height: 40,
                    //         decoration: BoxDecoration(
                    //             color: Colors.black,
                    //             borderRadius: BorderRadius.circular(8)
                    //         ),
                    //         width: mediaQuery.size.width,
                    //         padding: const EdgeInsets.symmetric(
                    //             horizontal: 8,
                    //             vertical: 8
                    //         ),
                    //         margin: const EdgeInsets.symmetric(
                    //             horizontal: 10,
                    //             vertical: 5
                    //         ),
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //           children: [
                    //             SizedBox(
                    //                 width: mediaQuery.size.width*0.25,
                    //                 child: scoreList2[index].team=="1"
                    //                     ?Text(scoreList2[index].name, textAlign: TextAlign.center,
                    //                   softWrap: true,
                    //                   overflow: TextOverflow.ellipsis,
                    //                   style: const TextStyle(color: Colors.white),)
                    //                     :const SizedBox()
                    //             ),
                    //             SizedBox(
                    //               width: mediaQuery.size.width*0.25,
                    //               child: Text(scoreList2[index].score, textAlign: TextAlign.center,
                    //                 softWrap: true,
                    //                 overflow: TextOverflow.ellipsis,
                    //                 style: TextStyle(color: Colors.white),),
                    //             ),
                    //             SizedBox(
                    //                 width: mediaQuery.size.width*0.25,
                    //                 child: scoreList2[index].team=="2"
                    //                     ?Text(scoreList2[index].name, textAlign: TextAlign.center,
                    //                   softWrap: true,
                    //                   overflow: TextOverflow.ellipsis,
                    //                   style: TextStyle(color: Colors.white),)
                    //                     :SizedBox()
                    //             )
                    //           ],
                    //         )
                    //     );
                    //   },
                    //     itemCount: scoreList2.length,
                    //     physics: NeverScrollableScrollPhysics(),
                    //   ),
                    // ),
                    //
                    // const Padding(
                    //   padding: EdgeInsets.symmetric(
                    //       horizontal: 25
                    //   ),
                    //   child: Text("Media #Clasico", style: TextStyle(color: Colors.white, fontSize: 18),),
                    // ),
                    // Expanded(
                    //     child: ListView.builder(itemBuilder: (context, index) {
                    //       return Container(
                    //         height: mediaQuery.size.height*0.2,
                    //         width: mediaQuery.size.width,
                    //         margin: const EdgeInsets.symmetric(
                    //             horizontal: 25,
                    //             vertical: 10
                    //         ),
                    //         decoration: BoxDecoration(
                    //             color: Colors.white,
                    //             borderRadius: BorderRadius.circular(10)
                    //         ),
                    //       );
                    //     },
                    //       itemCount: 2,
                    //       physics: NeverScrollableScrollPhysics(),
                    //     ))
                  ],
                )
            ),
          );
        }
        else{
          return const Text("Sorry Their is an Server Issue Occurring",
            style: TextStyle(fontSize: 12, color: Colors.white),
          );
        }
      },
    );
  }

  Future injuriesInformation() async{

    const String apiKey = "0a9ce6deb596f61f4e33463c192bd31c";

    var headers = {
      'x-rapidapi-key': apiKey,
      'x-rapidapi-host': 'https://api-football-v1.p.rapidapi.com/v3/injuries'
    };
    var request = http.Request(
        'GET',
        Uri.parse('https://v3.football.api-sports.io/injuries?league=39&season=2022')
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
