import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../FootballFavoriteBody/Teams/TeamInfo/TeamInfoMainScreen.dart';

class BasketBallTeams extends StatelessWidget {
  const BasketBallTeams({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return FutureBuilder(
      future: teamsInformation(),
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

          // return Text(response.toString(), style: TextStyle(fontSize: 12, color: Colors.white),);

          return Column(
            children: [
              ListTile(
                horizontalTitleGap: 20,
                dense: true,
                title: Text("Following", style: TextStyle(color: Colors.grey.shade400,
                ),),
              ),

              SizedBox(
                height: mediaQuery.size.height*0.25,
                child: ListView.builder(itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TeamInfoMainScreen(
                          "",
                          "",
                          "",
                          ""
                      ),
                      )
                      );
                    },
                    child: Container(
                      width: mediaQuery.size.width,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5
                      ),
                      decoration: BoxDecoration(
                          color: const Color(0xff161616),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(
                        child: ListTile(
                            dense: true,
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          response[index]["logo"].toString()
                                      ),
                                      fit: BoxFit.fill
                                  )
                              ),
                            ),
                            minLeadingWidth: 20,
                            title: Text(response[index]["name"].toString(), style: TextStyle(color: Colors.white),),
                            trailing: Icon(Icons.notifications, color: const Color(0xff9B8BFF),)
                        ),
                      ),
                    ),
                  );
                },
                  scrollDirection: Axis.vertical,
                  itemExtent: 65,
                  itemCount: response.length,
                  physics: BouncingScrollPhysics(),
                ),
              ),

              ListTile(
                horizontalTitleGap: 20,
                dense: true,
                title: Text("Suggested", style: TextStyle(color: Colors.grey.shade400,
                ),),
              ),

              SizedBox(
                height: mediaQuery.size.height*0.35,
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TeamInfoMainScreen(
                        "",
                        "",
                        "",
                        ""
                    ),));
                  },
                  child: ListView.builder(itemBuilder: (context, index) {
                    return Container(
                      width: mediaQuery.size.width,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5
                      ),
                      decoration: BoxDecoration(
                          color: const Color(0xff161616),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(
                        child: ListTile(
                            dense: true,
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        response[index]["logo"]
                                      ),
                                      fit: BoxFit.fill
                                  )
                              ),
                            ),
                            minLeadingWidth: 20,
                            title: Text(response[index]["name"], style: TextStyle(color: Colors.white),),
                            trailing: const Icon(Icons.notifications, color: const Color(0xff9B8BFF))
                        ),
                      ),
                    );
                  },
                    scrollDirection: Axis.vertical,
                    itemExtent: 65,
                    itemCount: response.length,
                    physics: BouncingScrollPhysics(),
                  ),
                ),
              )

            ],
          );
        }
        else {
          return const Text("Sorry Their is an Server Issue Occurring",
            style: TextStyle(fontSize: 12, color: Colors.white),
          );
        }
      },
    );
  }

  Future teamsInformation() async{

    const String apiKey = "0a9ce6deb596f61f4e33463c192bd31c";

    var headers = {
      'x-rapidapi-key': apiKey,
      'x-rapidapi-host': 'https://api-basketball.p.rapidapi.com/teams'
    };

    var request = http.Request(
        'GET',
        Uri.parse('https://v1.basketball.api-sports.io/teams?season=2021-2022&league=3')
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
