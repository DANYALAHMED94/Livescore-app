import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Getx Values Updater/Football_League_Notification_Icons_Replacer.dart';
import 'BottomNavigationScreens/MainScreen.dart';
import 'package:http/http.dart' as http;

class FavouriteCompetitorTeamScreen extends StatelessWidget {
  FavouriteCompetitorTeamScreen({super.key});

  FootballLeagueNotificationsIconsReplacer favoriteLeagueList = Get.put(FootballLeagueNotificationsIconsReplacer());

  List<String> footballLeaguesID = [
    "2",
    "39",
    "71",
    "140",
  ];

  List<String> basketballLeaguesID = [
    "12",
  ];

  List<String> tennisLeaguesID = [
    "",
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff101010),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 24,
                    ),
                ),
                const SizedBox(height: 32),
                const Text(
                  'Pick Your Favourite Competitions To Follow',
                  style: TextStyle(
                      fontSize: 18, color: Colors.white, fontFamily: 'lucky'),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  height: 50,
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: 'Search',
                        fillColor: const Color(0xff212121),
                        filled: true,
                        hintStyle: const TextStyle(
                          color: Color(0xff808080),
                        ),
                        prefixIcon: const Icon(Icons.search,color: Color(0xff808080),),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                const SizedBox(height: 32),
                const Text(
                  'SUGGESTED',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffCCCCCC)),
                ),
                const SizedBox(height: 16),
                FutureBuilder(
                  future: footballLeagueInformation(),
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

                      var filteredResponse = response
                          .where((item) => footballLeaguesID.contains(item["league"]["id"].toString()))
                          .toList();

                      return Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.355,
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: (){

                                    if(favoriteLeagueList.selectedTeamIds.toString().contains(filteredResponse[index]["league"]["id"].toString()))
                                    {
                                      favoriteLeagueList.removeFromFavouriteMethod(filteredResponse[index]["league"]["id"].toString());
                                    }
                                    else{
                                      favoriteLeagueList.addToFavouriteMethod(filteredResponse[index]["league"]["id"].toString());
                                    }
                                  },
                                  child: favTeamList(
                                    filteredResponse[index]["league"]["name"].toString(),
                                    filteredResponse[index]["league"]["logo"].toString(),
                                    filteredResponse[index]["league"]["id"].toString(),
                                  ),
                                );
                              },
                              itemCount: filteredResponse.length,
                              physics: const NeverScrollableScrollPhysics(),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){

                              if(favoriteLeagueList.selectedTeamIds.toString().contains("12"))
                              {
                                favoriteLeagueList.removeFromFavouriteMethod("12");
                              }
                              else{
                                favoriteLeagueList.addToFavouriteMethod("12");
                              }
                            },
                            child: favTeamList(
                              "NBA",
                              "https:\/\/media.api-sports.io\/basketball\/leagues\/12.png",
                              "12",
                            ),
                          ),
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
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: const MaterialStatePropertyAll(
                              Color(0xff9B8BFF),
                            ),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )
                            )
                        ),
                        onPressed: () {
                          dataLeagueIDStorage(context);
                        },
                        child: const Text(
                          'Save',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future footballLeagueInformation() async{

    const String apiKey = "0a9ce6deb596f61f4e33463c192bd31c";

    var headers = {
      'x-rapidapi-key': apiKey,
      'x-rapidapi-host': 'https://api-football-v1.p.rapidapi.com/v3/leagues'
    };
    var request = http.Request(
        'GET',
        Uri.parse('https://v3.football.api-sports.io/leagues?season=2023')
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

  Future basketballLeagueInformation() async{

    const String apiKey = "0a9ce6deb596f61f4e33463c192bd31c";

    var headers = {
      'x-rapidapi-key': apiKey,
      'x-rapidapi-host': 'https://api-basketball.p.rapidapi.com/leagues'
    };
    var request = http.Request(
        'GET',
        Uri.parse('https://v1.basketball.api-sports.io/leagues?id=12')
    );

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }
  }

  Widget favTeamList(String leagueName, String leagueLogo, String id) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      color: const Color(0xff161616),
      child: Container(
        color: Colors.transparent,
        margin: const EdgeInsets.symmetric(
            vertical: 5
        ),
        child: ListTile(
          dense: true,
          leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage(
                  leagueLogo.toString()
              )
          ),
          title: Text(
            leagueName.toString(),
            style: const TextStyle(
              color: Color(0xff9B8BFF),
            ),
          ),
          trailing: Obx(() => Icon(
            favoriteLeagueList.selectedTeamIds.contains(id)?Icons.notifications_active:Icons.notifications_outlined,
            color: Color(0xff9B8BFF),
          ))
        ),
      ),
    );
  }



  dataLeagueIDStorage(BuildContext context) async{

    DatabaseReference ref = FirebaseDatabase.instance.ref("1").child("favoriteLeagueList");



    await ref.set({
      "League1ID": favoriteLeagueList.selectedTeamIds.length > 0 ? (favoriteLeagueList.selectedTeamIds[0]?.toString()?.isEmpty ?? true) ? "" : favoriteLeagueList.selectedTeamIds[0]?.toString() : "",
      "League2ID": favoriteLeagueList.selectedTeamIds.length > 1 ? (favoriteLeagueList.selectedTeamIds[1]?.toString()?.isEmpty ?? true) ? "" : favoriteLeagueList.selectedTeamIds[1]?.toString() : "",
      "League3ID": favoriteLeagueList.selectedTeamIds.length > 2 ? (favoriteLeagueList.selectedTeamIds[2]?.toString()?.isEmpty ?? true) ? "" : favoriteLeagueList.selectedTeamIds[2]?.toString() : "",
      "League4ID": favoriteLeagueList.selectedTeamIds.length > 3 ? (favoriteLeagueList.selectedTeamIds[3]?.toString()?.isEmpty ?? true) ? "" : favoriteLeagueList.selectedTeamIds[3]?.toString() : "",
      "League5ID": favoriteLeagueList.selectedTeamIds.length > 4 ? (favoriteLeagueList.selectedTeamIds[4]?.toString()?.isEmpty ?? true) ? "" : favoriteLeagueList.selectedTeamIds[4]?.toString() : "",
    }).then((value) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  MainScreen(gameChoice: "Football")
          )
      );
    }).onError((error, stackTrace){
      Fluttertoast.showToast(msg: error.toString());
    });
  }

}
