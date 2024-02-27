import 'dart:convert';
import 'package:flutter/material.dart';
import '../../setting_screen.dart';
import '../DashBoards/SearchIcons/BasketballSearchLeague.dart';
import '../MatchesMenusSelections.dart';
import 'package:http/http.dart' as http;
import 'SubScreensStats/BasketBallSubStats/BasketballMainStatsSubScreen.dart';

class BasketBallStats extends StatelessWidget {
  const BasketBallStats({super.key});

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
                MaterialPageRoute(builder: (context) => BasketballSearchLeague(),));
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
          onTap: (){
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
                Text("\tBASKETBALL", style: TextStyle(color: Colors.white, fontSize: 13),),
                Icon(Icons.arrow_drop_down, color: Colors.white,size: 25,)
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
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

                  return SizedBox(
                    height: mediaQuery.size.height*0.78,
                    child: ListView.separated(itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) =>
                                  BasketBallMainSubStatsScreens(
                                    country: response[index]["country"]["name"].toString(),
                                    name: response[index]["name"].toString(),
                                    leagueId: response[index]["id"].toString(),
                                    logo: response[index]["logo"].toString(),
                                  ),
                              )
                          );
                        },
                        child: SizedBox(
                            height: 50,
                            width: mediaQuery.size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ListTile(
                                    dense: true,
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    leading: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      backgroundImage: NetworkImage(
                                          response[index]["logo"].toString()
                                      ),
                                      radius: 18,
                                    ),
                                    title: Text(response[index]["name"], style: TextStyle(color: Colors.white),),
                                    trailing: IconButton(
                                        onPressed: (){
                                          Navigator.push(context,
                                              MaterialPageRoute(builder: (context) =>
                                                  BasketBallMainSubStatsScreens(
                                                    country: response[index]["country"]["name"].toString(),
                                                    name: response[index]["name"].toString(),
                                                    leagueId: response[index]["id"].toString(),
                                                    logo: response[index]["logo"].toString(),
                                                  ),
                                              )
                                          );
                                        },
                                        icon: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18,)
                                    )
                                ),
                              ],
                            )
                        ),
                      );
                    },
                      separatorBuilder: (context, index) => Divider(
                        thickness: 0.5,
                      ),
                      itemCount: response.length,
                      physics: BouncingScrollPhysics(),
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
          ],
        ),
      ),
    );
  }

  Future leagueInformation() async{

    const String apiKey = "0a9ce6deb596f61f4e33463c192bd31c";

    var headers = {
      'x-rapidapi-key': apiKey,
      'x-rapidapi-host': 'https://v1.basketball.api-sports.io/leagues'
    };

    var request = http.Request(
        'GET',
        Uri.parse('https://v1.basketball.api-sports.io/leagues?season=2020-2021')
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
