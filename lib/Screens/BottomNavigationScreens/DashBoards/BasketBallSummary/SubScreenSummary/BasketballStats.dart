import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:live_score_app/Screens/ModelClasses/FootballStatistics.dart';

class BasketballStats extends StatelessWidget {

  String gameId;

  BasketballStats({super.key, required this.gameId});

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

              // return Text(response.toString(), style: const TextStyle(fontSize: 12, color: Colors.white),);

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
                            response[0]["scores"]["home"]["quarter_${index+1}"].toString(),
                            response[0]["scores"]["away"]["quarter_${index+1}"].toString(),
                            "QUARTER ${index+1}",
                            // response[0]["scores"]["home"]["total"].toString(),
                            // response[0]["scores"]["away"]["total"].toString(),
                        );
                      },
                        itemCount: 4,
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
      String type,
      )
  {

    int team1Score = int.parse(team1Value);
    int team2Score = int.parse(team2Value);

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
              Text(team1Score.toString(), style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15
              ),),
              Text(type, style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              ),),
              Text(
                team2Value.toString(),
                style: const TextStyle(
                  color: Colors.white,
                    fontWeight: FontWeight.bold,
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
              value: double.parse((team1Score+team2Score).toString())/100,
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
      'x-rapidapi-host': 'https://api-basketball.p.rapidapi.com/games'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
          "https://v1.basketball.api-sports.io/games?id=$gameId"
        )
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
