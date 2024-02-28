import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:live_score_app/Screens/BottomNavigationScreens/DashBoards/SearchIcons/FootballLeagueSearch.dart';
import '../../../ModelClasses/LeagueModel.dart';
import '../../../setting_screen.dart';
import '../../MatchesMenusSelections.dart';
import '../../DashBoards/SearchIcons/FootBallSearchIcon.dart';
import 'FootBallSubStats/FootballMainStatsSubScreen.dart';

class FootBallStats extends StatelessWidget {
  FootBallStats({super.key});

  List<LeagueModel> leagueList = [];

  List<String> leaguesId = [
    "39",
    "71",
    "61",
    "78",
    "88",
    "2",
    "3"
  ];

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: const Color(0xff101010),
        appBar: AppBar(
          backgroundColor: const Color(0xff0D0D0D),
          actions: [
            IconButton(onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FootballLeaguesSearchIcon(),));
            }, icon: const Icon(Icons.search, size: 28, color: Colors.white,)),
            Padding(
              padding: const EdgeInsets.only(
                  right: 8
              ),
              child: IconButton(onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SettingScreen()));
              }, icon: const Icon(Icons.dehaze, size: 28,color: Colors.white,)),
            )
          ],
          leadingWidth: mediaQuery.size.width*0.35,
          surfaceTintColor: Colors.transparent,
          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      const MatchesMenusSelector()));
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("\tFOOTBALL", style: TextStyle(color: Colors.white, fontSize: 13),),
                  Icon(Icons.arrow_drop_down, color: Colors.white,size: 25,)
                ],
              ),
            ),
          ),
        ),
        body: SizedBox(
          height: mediaQuery.size.height,
          width: mediaQuery.size.width,
          child: Stack(
            clipBehavior: Clip.none,
            children: [

              FutureBuilder(
                  future: leagueInformation(),
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

                      for(var leagueInfo in response) {
                        leagueList.add(
                          LeagueModel(
                            leagueInfo["league"]["name"].toString(),
                            leagueInfo["league"]["id"].toString(),
                            leagueInfo["country"]["name"].toString(),
                            leagueInfo["league"]["logo"].toString(),
                          )
                        );
                      }

                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              height: 30,
                              padding: const EdgeInsets.only(
                                  top: 5,
                                  left: 20
                              ),
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10
                              ),
                              width: mediaQuery.size.width,
                              color: Colors.grey.shade300,
                              child: const Text("Top Competitions", style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                            ),

                            SizedBox(
                                height: mediaQuery.size.height*1.56,
                                child: ListView.builder(
                                  itemBuilder: (context, index) {

                                    if(leaguesId.contains(leagueList[index].leagueId.toString())){
                                      return GestureDetector(
                                        onTap: (){
                                          Navigator.push(context,
                                              MaterialPageRoute(builder: (context) =>
                                                  FootBallMainSubStatsScreens(
                                                    leagueName: leagueList[index].leagueName.toString(),
                                                    leagueID: leagueList[index].leagueId.toString(),
                                                    leagueLogo: leagueList[index].leagueLogo.toString(),
                                                    leagueCountry: leagueList[index].leagueCountry.toString(),
                                                  ),
                                              )
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey,
                                              width: 0.2,
                                              style: BorderStyle.solid
                                            )
                                          ),
                                          height: 60,
                                          width: mediaQuery.size.width,
                                          child: ListTile(
                                              dense: true,
                                              contentPadding: const EdgeInsets.symmetric(
                                                horizontal: 10,
                                              ),
                                              leading: CircleAvatar(
                                                backgroundColor: Colors.transparent,
                                                backgroundImage: NetworkImage(
                                                    leagueList[index].leagueLogo.toString()
                                                ),
                                                radius: 20,
                                              ),
                                              title: Text(leagueList[index].leagueName.toString(), style: TextStyle(color: Colors.white),),
                                              subtitle: Text(leagueList[index].leagueCountry.toString(), style: TextStyle(color: Colors.white),),
                                              trailing: IconButton(
                                                  onPressed: (){
                                                    Navigator.push(context,
                                                        MaterialPageRoute(builder: (context) =>
                                                            FootBallMainSubStatsScreens(
                                                              leagueName: leagueList[index].leagueName.toString(),
                                                              leagueID: leagueList[index].leagueId.toString(),
                                                              leagueLogo: leagueList[index].leagueLogo.toString(),
                                                              leagueCountry: leagueList[index].leagueCountry.toString(),
                                                            ),
                                                        )
                                                    );
                                                  },
                                                  icon: const Icon(Icons.arrow_forward_ios, color: Colors.white,size: 18,)
                                              )
                                          ),
                                        ),
                                      );
                                    }
                                    return SizedBox();
                                    },
                                  // separatorBuilder: (context, index) => Divider(thickness: 0.5,),
                                  itemCount: leagueList.length,
                                  physics: const BouncingScrollPhysics(),
                                )
                            ),

                          ],
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

              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: mediaQuery.size.height*0.06,
                  width: mediaQuery.size.width,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 5
                  ),
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage("assets/images/banner.png"),
                          fit: BoxFit.fill
                      ),
                      color: Colors.grey.shade500,
                      borderRadius: BorderRadius.circular(8)
                  ),
                ),
              ),
            ],
          )
        )
    );
  }

  Future leagueInformation() async{

    const String apiKey = "0a9ce6deb596f61f4e33463c192bd31c";

    var headers = {
      'x-rapidapi-key': apiKey,
      'x-rapidapi-host': 'https://api-football-v1.p.rapidapi.com/v3/leagues'
    };

    var request = http.Request(
        'GET',
        Uri.parse('https://v3.football.api-sports.io/leagues?season=2021')
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
