import 'dart:convert';
import 'package:flutter/material.dart';
import '../../../ModelClasses/LeagueModel.dart';
import '../../FavouriteScreen/FootballFavoriteBody/Teams/TeamInfo/TeamInfoMainScreen.dart';
import 'package:http/http.dart' as http;

import '../../Stats/FootballStats/FootBallSubStats/FootballMainStatsSubScreen.dart';

class FootballLeaguesSearchIcon extends StatefulWidget {
  FootballLeaguesSearchIcon({super.key});

  @override
  State<FootballLeaguesSearchIcon> createState() => _FootballLeaguesSearchIconState();
}

class _FootballLeaguesSearchIconState extends State<FootballLeaguesSearchIcon> {

  String searchText = "";

  List<LeagueModel> leagueList = [];

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xff101010),
        body: SizedBox(
          height: mediaQuery.size.height,
          width: mediaQuery.size.width,
          child: Stack(
            children: [
              Positioned(
                top: mediaQuery.size.height*0.05,
                left: 10,
                right: 10,
                child: SizedBox(
                  height: 55,
                  // width: mediaQuery.size.width,
                  child: TextField(
                    onChanged: (value) {
                      searchText = value;
                      setState(() {

                      });
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: 'Search',
                        filled: true,
                        fillColor: Colors.transparent,
                        hintStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w200
                        ),
                        prefixIcon: IconButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.close,color: Colors.white,),),
                        suffixIcon: const Icon(Icons.search,color: Colors.white,),
                        border: InputBorder.none
                    ),
                  ),
                ),
              ),

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

                    return Positioned(
                      left: 0,
                      right: 0,
                      top: mediaQuery.size.height*0.15,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [

                            SizedBox(
                                height: mediaQuery.size.height*1.56,
                                child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    if (leagueList[index].leagueName.toString()
                                        .toString()
                                        .toLowerCase()
                                        .contains(searchText.toLowerCase()))
                                    {
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
                                              radius: 18,
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
                                      );
                                    }
                                    else{
                                      return const SizedBox();
                                    }
                                  },
                                  itemCount: leagueList.length,
                                  physics: const BouncingScrollPhysics(),
                                )
                            ),

                          ],
                        ),
                      ),
                    );
                  }
                  else{
                    return const Text("Sorry Their is an Server Issue Occurring",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    );
                  }
                },
              ),

              Positioned(
                top: mediaQuery.size.height*0.125,
                child: Container(
                    height: mediaQuery.size.height*0.06,
                    color: const Color(0xff101010),
                    width: mediaQuery.size.width,
                    child: const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 18
                          ),
                          child: Text("Suggestion for you", style: TextStyle(fontSize: 15, color: Colors.white),),
                        )
                      ],
                    )
                ),
              ),
            ],
          ),
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
