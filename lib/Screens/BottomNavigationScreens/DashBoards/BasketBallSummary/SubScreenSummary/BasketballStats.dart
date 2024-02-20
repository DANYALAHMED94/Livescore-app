import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:live_score_app/Screens/ModelClasses/FootballStatistics.dart';

class BasketballStats extends StatelessWidget {

  String fixtureId;
  BasketballStats({super.key, required this.fixtureId});

  // List<StatsLinearProgressModel> quarter1 = [
  //   StatsLinearProgressModel(0.59, "Field Goals Attempted"),
  //   StatsLinearProgressModel(0.20, "Field Goals Made"),
  //   StatsLinearProgressModel(0.40, "Field Goals"),
  //   StatsLinearProgressModel(0.60, "Offsides"),
  //   StatsLinearProgressModel(0.30, "Free throw attempted"),
  //   StatsLinearProgressModel(0.80, "offensive Rebounds"),
  //   StatsLinearProgressModel(0.70, "Defensive Rebounds"),
  //   StatsLinearProgressModel(0.40, "Blocks"),
  // ];

  List<FootballStatistics> statisticsList1 = [];

  List<FootballStatistics> statisticsList2 = [];

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
          horizontal: 10
      ),
      child: SizedBox(
        width: mediaQuery.size.width,
        height: mediaQuery.size.height*1.8,
        child: FutureBuilder(
          future: statisticsInformation(),
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

              // return Text(response[0].toString(), style: TextStyle(fontSize: 12, color: Colors.white),);

              var statisticsInfo1 = response[0]["statistics"];
              var statisticsInfo2 = response[1]["statistics"];

              for(var statsInfo in statisticsInfo1) {
                statisticsList1
                    .add(
                    FootballStatistics(
                        statsInfo["value"].toString(),
                        statsInfo["type"].toString()
                    )
                );
              }

              for(var statsInfo in statisticsInfo2) {
                statisticsList2
                    .add(
                    FootballStatistics(
                        statsInfo["value"].toString(),
                        statsInfo["type"].toString()
                    )
                );
              }


              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Audio Commentary", style: TextStyle(
                              color: Colors.white,
                            ),),
                            SizedBox(width: 10,),
                            Icon(Icons.multitrack_audio, size: 25,color: Colors.white,),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                      height: mediaQuery.size.height*1.5,
                      width: mediaQuery.size.width,
                      child: ListView.builder(itemBuilder: (context, index) {
                        return linearProgressContainerBuilder(
                          statisticsList1[index].value.toString(),
                          statisticsList2[index].value.toString(),
                          statisticsList2[index].type.toString(),
                        );
                      },
                        itemCount: statisticsList1.length,
                        physics: NeverScrollableScrollPhysics(),
                      )),
                  // const Text("2st Quarter", style: TextStyle(
                  //     color: Colors.white,
                  //     fontSize: 16
                  // ),),
                  // SizedBox(
                  //     height: mediaQuery.size.height*0.8,
                  //     child: ListView.builder(itemBuilder: (context, index) {
                  //       return linearProgressContainerBuilder(index);
                  //     },
                  //       itemCount: quarter1.length,
                  //       physics: NeverScrollableScrollPhysics(),
                  //     )),
                  // const Text("3st Quarter", style: TextStyle(
                  //     color: Colors.white,
                  //     fontSize: 16
                  // ),),
                  // SizedBox(
                  //     height: mediaQuery.size.height*0.8,
                  //     child: ListView.builder(itemBuilder: (context, index) {
                  //       return linearProgressContainerBuilder(index);
                  //     },
                  //       itemCount: quarter1.length,
                  //       physics: NeverScrollableScrollPhysics(),
                  //     )),
                  // const Text("4st Quarter", style: TextStyle(
                  //     color: Colors.white,
                  //     fontSize: 16
                  // ),),
                  // SizedBox(
                  //     height: mediaQuery.size.height*0.8,
                  //     child: ListView.builder(itemBuilder: (context, index) {
                  //       return linearProgressContainerBuilder(index);
                  //     },
                  //       itemCount: quarter1.length,
                  //       physics: NeverScrollableScrollPhysics(),
                  //     )),
                  // const Text("5st Quarter", style: TextStyle(
                  //     color: Colors.white,
                  //     fontSize: 16
                  // ),),
                  // SizedBox(
                  //     height: mediaQuery.size.height*0.8,
                  //     child: ListView.builder(itemBuilder: (context, index) {
                  //       return linearProgressContainerBuilder(index);
                  //     },
                  //       itemCount: quarter1.length,
                  //       physics: NeverScrollableScrollPhysics(),
                  //     )),
                ],
              );
            }
            else{
              return const Text("Sorry Their is an Server Issue Occurring",
                style: TextStyle(fontSize: 12, color: Colors.white),
              );
            }
          },
        ),
      ),
    );
  }

  Widget linearProgressContainerBuilder(
      String team1Value,
      String team2Value,
      String type
      )
  {

    if(team1Value.contains("%")) {
      team1Value.substring(0, team1Value.length-1);
    }
    if(team2Value.contains("%")) {
      team2Value.substring(0, team2Value.length-1);
    }

    return Container(
      height: 60,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 8
      ),
      padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5
      ),
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${team1Value.toString()}%", style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15
              ),),
              Text(type.toString(), style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15
              ),),
              Text("${team1Value.toString()}%", style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15
              ),),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(
                vertical: 5
            ),
            height: 5,
            width: double.infinity,
            child: LinearProgressIndicator(
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation<Color>(const Color(0xff9B8BFF),),
              value: 0.5,
            ),
          ),
        ],
      ),
    );
  }

  Future statisticsInformation() async{

    const String apiKey = "0a9ce6deb596f61f4e33463c192bd31c";

    var headers = {
      'x-rapidapi-key': apiKey,
      'x-rapidapi-host': 'https://api-football-v1.p.rapidapi.com/v3/fixtures/statistics'
    };
    var request = http.Request(
        'GET',
        Uri.parse('https://v3.football.api-sports.io/fixtures/statistics?fixture=${fixtureId.toString()}')
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
