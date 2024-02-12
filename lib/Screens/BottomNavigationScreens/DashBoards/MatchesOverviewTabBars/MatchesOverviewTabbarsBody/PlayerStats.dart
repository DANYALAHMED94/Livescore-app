import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:live_score_app/Screens/BottomNavigationScreens/DashBoards/MatchesOverviewTabBars/MatchesOverviewTabbarsBody/Player&TeamTabsScreens/RedCards.dart';
import 'package:live_score_app/Screens/ModelClasses/PlayerStatsModel/PlayerStatsModel.dart';
import 'package:live_score_app/Screens/BottomNavigationScreens/DashBoards/MatchesOverviewTabBars/MatchesOverviewTabbarsBody/Player&TeamTabsScreens/TopAssetsScreen.dart';
import 'package:live_score_app/Screens/BottomNavigationScreens/DashBoards/MatchesOverviewTabBars/MatchesOverviewTabbarsBody/Player&TeamTabsScreens/YellowCardsScreen.dart';
import 'Player&TeamTabsScreens/AllScores.dart';
import 'Player&TeamTabsScreens/GoalsScreen.dart';
import 'package:http/http.dart' as http;


class PlayerStatsScreen extends StatelessWidget {
  int selection;
  String leagueId;
  PlayerStatsScreen({super.key, required this.selection, required this.leagueId});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    List<Widget> tabScreensList = [
      AllScoresListedContainers(leagueID: leagueId),
      GoalsScreen(selectedIndex: selection, leagueID: leagueId),
      TopAssets(selectedIndex: selection, leagueID: leagueId),
      RedCardsScreen(selectedIndex: selection, leagueID: leagueId),
      YellowCardsScreen(selectedIndex: selection, leagueID: leagueId),
      GoalsScreen(selectedIndex: selection, leagueID: leagueId),
    ];

    return SingleChildScrollView(
      child: SizedBox(
        height:  selection==0?mediaQuery.size.height*2.55:mediaQuery.size.height*1.5  ,
        width: mediaQuery.size.width,
        child: Stack(
          children: [
            Positioned(
              top: mediaQuery.size.height*0.07,
              left: 0,
              right: 0,
              child: tabScreensList[selection],
            ),
          ],
        ),
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
