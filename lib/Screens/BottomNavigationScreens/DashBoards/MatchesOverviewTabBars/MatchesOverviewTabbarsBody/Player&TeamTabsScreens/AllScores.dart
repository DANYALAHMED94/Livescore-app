import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:live_score_app/Screens/BottomNavigationScreens/DashBoards/MatchesOverviewTabBars/MatchesOverviewTabbarsBody/Player&TeamTabsScreens/GoalsScreen.dart';
import 'package:live_score_app/Screens/BottomNavigationScreens/DashBoards/MatchesOverviewTabBars/MatchesOverviewTabbarsBody/Player&TeamTabsScreens/RedCards.dart';
import 'package:live_score_app/Screens/BottomNavigationScreens/DashBoards/MatchesOverviewTabBars/MatchesOverviewTabbarsBody/Player&TeamTabsScreens/TopAssetsScreen.dart';
import 'package:live_score_app/Screens/BottomNavigationScreens/DashBoards/MatchesOverviewTabBars/MatchesOverviewTabbarsBody/Player&TeamTabsScreens/YellowCardsScreen.dart';
import 'package:live_score_app/Screens/ModelClasses/PlayerStatsModel/PlayerStatsModel.dart';
import 'package:http/http.dart' as http;

class AllScoresListedContainers extends StatelessWidget {
  String leagueID;
  AllScoresListedContainers({super.key, required this.leagueID});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: mediaQuery.size.height*2.55,
            width: mediaQuery.size.width,
            child: ListView.builder(itemBuilder: (context, index) {

              return topScoresCardBuilder(
                context,
                index,
              );

            },
              itemCount: 4,
              physics: NeverScrollableScrollPhysics(),
            ),
          )
        ],
      ),
    );
  }
  Widget topScoresCardBuilder(
      BuildContext context,
      int outerIndex,
      )
  {
    var mediaQuery = MediaQuery.of(context);
    return Container(
      height: mediaQuery.size.height*0.46,
      width: mediaQuery.size.width,
      margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: Colors.grey,
              width: 0.3,
              style: BorderStyle.solid
          )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ListTile(
            dense: true,
            title: Text("TOP SCORES", style: TextStyle(fontSize: 15, color: Colors.white)),
            leading: Text("#", style: TextStyle(fontSize: 15, color: Colors.white)),
          ),

          FutureBuilder(
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

                  return Expanded(
                    child: ListView.builder(itemBuilder: (context, index) {
                      final stats = playerStatistics[index];
                      return Container(
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
                        child: listTileSelector(
                          context,
                          outerIndex,
                          stats.teamName.toString(),
                          stats.teamLogo.toString(),
                          stats.goals.toString(),
                          stats.yellowCards.toString(),
                          stats.redCards.toString(),
                          stats.assets.toString(),
                        ),
                      );
                    },
                      itemExtent: 50,
                      itemCount: 5,
                      physics: NeverScrollableScrollPhysics(),
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

          ListTile(
            onTap: (){
              if(outerIndex == 0) {
                Navigator
                    .push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GoalsScreen(
                          selectedIndex: outerIndex+1,
                          leagueID: leagueID),
                    )
                );
              }
              else if(outerIndex == 1) {
                Navigator
                    .push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TopAssets(
                          selectedIndex: outerIndex+1,
                          leagueID: leagueID
                      )
                    )
                );
              }
              else if(outerIndex == 1) {
                Navigator
                    .push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RedCardsScreen(
                          selectedIndex: outerIndex+1,
                          leagueID: leagueID
                      )
                    )
                );
              }
              else{
                Navigator
                    .push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => YellowCardsScreen(
                          selectedIndex: outerIndex+1,
                          leagueID: leagueID
                      )
                    )
                );
              }
            },
            dense: true,
            title: Center(child: Text("See All", style: TextStyle(fontSize: 15, color: Colors.white))),
          ),
        ],
      ),
    );
  }

  Widget listTileSelector(
      BuildContext context,
      int index,
      String teamName,
      String teamLogo,
      String goals,
      String yellowCards,
      String redCards,
      String assets
      )
  {
    var mediaQuery = MediaQuery.of(context);

    if(index == 0) {
      return ListTile(
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
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(teamName,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: TextStyle(fontSize: 12, color: Colors.white)),
                  ),
                ],
              ),
            )
          ],
        ),
        trailing: Text(goals, style: TextStyle(fontSize: 15, color: Colors.white)),
      );
    }
    else if(index == 1) {
      return ListTile(
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
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(teamName,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: TextStyle(fontSize: 12, color: Colors.white)),
                  ),
                ],
              ),
            )
          ],
        ),
        trailing: Text(assets, style: TextStyle(fontSize: 15, color: Colors.white)),
      );
    }
    else if(index == 2) {
      return ListTile(
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
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(teamName,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: TextStyle(fontSize: 12, color: Colors.white)),
                  ),
                ],
              ),
            )
          ],
        ),
        trailing: Text(redCards, style: TextStyle(fontSize: 15, color: Colors.white)),
      );
    }
    else{
      return ListTile(
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
                    child: Text(teamName,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: const TextStyle(fontSize: 12, color: Colors.white)),
                  ),
                ],
              ),
            )
          ],
        ),
        trailing: Text(yellowCards, style: const TextStyle(fontSize: 15, color: Colors.white)),
      );
    }
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
