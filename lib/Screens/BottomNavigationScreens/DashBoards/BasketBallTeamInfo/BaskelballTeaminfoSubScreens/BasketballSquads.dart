import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../ModelClasses/SquadModel.dart';
import '../../../FavouriteScreen/FootballFavoriteBody/Teams/TeamInfo/PlayersProfileScreen/PlayerProfileMainScreen.dart';

class BasketballGroups extends StatelessWidget {
  String teamID, teamName, teamLogo;

  BasketballGroups(this.teamID, this.teamName, this.teamLogo);

  List<SquadModel> squadList = [];

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 15
      ),
      child: SizedBox(
        height: mediaQuery.size.height*2.3,
        width: mediaQuery.size.width,
        // color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  height: 50,
                  width: mediaQuery.size.width,
                  decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                            color: Colors.grey,
                            width: 0.5,
                            style: BorderStyle.solid
                        ),
                        bottom: BorderSide(
                            color: Colors.grey,
                            width: 0.5,
                            style: BorderStyle.solid
                        ),

                      )
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15
                    ),
                    child: Text(
                      "GROUPS LIST",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic , fontSize: 18, fontWeight: FontWeight.bold),),
                  ),
                ),

                FutureBuilder(
                  future: groupInformation(),
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

                      return SizedBox(
                        height: mediaQuery.size.height*0.7,
                        child: ListView.separated(itemBuilder: (context, index) {
                          return ListTile(
                            title: Text("${response[index]}",
                              softWrap: true,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(color: Colors.white, fontSize: 12),),
                            dense: true,
                          );
                        }, separatorBuilder: (context, index) {
                          return const Divider(color: Colors.grey, thickness: 0.5,);
                        },
                            physics: const BouncingScrollPhysics(),
                            itemCount: response.length
                        ),
                      );
                    }
                    else{
                      return const Text("Sorry Their is an Server Issue Occurring",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      );
                    }
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future groupInformation() async{

    const String apiKey = "0a9ce6deb596f61f4e33463c192bd31c";

    var headers = {
      'x-rapidapi-key': apiKey,
      'x-rapidapi-host': 'https://api-basketball.p.rapidapi.com/standings/groups'
    };
    var request = http.Request(
        'GET',
        Uri.parse('https://v1.basketball.api-sports.io/standings/groups?season=2019-2020&league=12')
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
