import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:live_score_app/Screens/ModelClasses/PlayerStatsModel/PlayerStatsModel.dart';

class TopAssets extends StatelessWidget {
  int selectedIndex;
  String leagueID;
  TopAssets({
    super.key,
    required this.selectedIndex,
    required this.leagueID
  });

  // List<PlayerStatistics> teamsGoalsInfoList=[];

  List<String> lisTileTextHeadings = [
    "TOP SCORES",
    "TOP ASSETS",
    "RED CARDS",
    "YELLOW CARDS",
    "SHOTS ON TARGET"
  ];

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return SingleChildScrollView(
      child: FutureBuilder(
        future: playerStatsInformation(),
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

            final playerStatistics = snapshot.data!;

            // return Text(stats.teamLogo, style: TextStyle(fontSize: 12, color: Colors.white),);

            return SizedBox(
                height: mediaQuery.size.height*1.5,
                width: mediaQuery.size.width,
                child: Column(
                  children: [
                    ListTile(
                      dense: true,
                      title: Text(lisTileTextHeadings[selectedIndex-1], style: TextStyle(fontSize: 15, color: Colors.white)),
                      leading: const Text("#", style: TextStyle(fontSize: 15, color: Colors.white)),
                    ),

                    SizedBox(
                      height: mediaQuery.size.height*0.8,
                      child: ListView.builder(
                        itemCount: playerStatistics.length,
                        itemBuilder: (context, index) {
                          final stats = playerStatistics[index];

                          // return Text(stats.teamLogo, style: TextStyle(fontSize: 12, color: Colors.white),);

                          return assetsContainer(
                            context,
                            index,
                            stats.assets.toString(),
                            stats.teamName.toString(),
                            stats.teamLogo.toString(),
                          );
                        },
                        physics: BouncingScrollPhysics(),
                      ),
                    )
                  ],
                )
            );
          }
          else {
            return const Text("Sorry Their is an Server Issue Occurring",
              style: TextStyle(fontSize: 12, color: Colors.white),
            );
          }
        },
      ),
    );
  }

  Widget assetsContainer(BuildContext context, int index,
      String assets, String teamName, String teamLogo)
  {

    var mediaQuery = MediaQuery.of(context);

    return Container(
      height: 40,
      width: mediaQuery.size.width,
      margin: const EdgeInsets.symmetric(
          vertical: 2,
          horizontal: 10
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
            color: Colors.white,
            style: BorderStyle.solid,
            width: 0.1
        ),
      ),
      child: ListTile(
        minLeadingWidth: 1,
        dense: true,
        leading: Text("${index+1}", style: TextStyle(fontSize: 15, color: Colors.white)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: mediaQuery.size.width*0.37,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: NetworkImage(
                        teamLogo
                    ),
                    radius: 15,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                        teamName,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: TextStyle(fontSize: 12, color: Colors.white)),
                  ),
                ],
              ),
            )
          ],
        ),
        trailing: Text(assets.toString(), style: TextStyle(fontSize: 15, color: Colors.white)),
      ),
    );
  }

  Future<List<PlayerStatistics>> playerStatsInformation() async{

    const String apiKey = "0a9ce6deb596f61f4e33463c192bd31c";

    var headers = {
      'x-rapidapi-key': apiKey,
      'x-rapidapi-host': 'https://api-football-v1.p.rapidapi.com/v3/players/topscorers'
    };

    var request = http.Request(
        'GET',
        Uri.parse('https://v3.football.api-sports.io/players/topscorers?league=39&season=2021')
    );

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {

      final jsonResponse = json.decode(await response.stream.bytesToString());

      return List<PlayerStatistics>.from(
          jsonResponse['response']
              .map((data) =>
              PlayerStatistics.fromJson(data)
          )
      );
    }

    else {
      throw Exception('Failed to load data');
    }
  }
}
