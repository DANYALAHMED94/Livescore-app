import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:live_score_app/Screens/BottomNavigationScreens/DashBoards/BasketBallTeamInfo/BasketballTeamInfo.dart';
// import '../../FavouriteScreen/FootballFavoriteBody/Teams/TeamInfo/TeamInfoMainScreen.dart';
import 'package:http/http.dart' as http;

class BasketBallSearchIcon extends StatelessWidget {
  const BasketBallSearchIcon({super.key});

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
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: 'Search',
                        // fillColor: const Color(0xff212121),
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
                future: teamInformation(),
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

                    return Positioned(
                      left: 0,
                      right: 0,
                      top: mediaQuery.size.height*0.15,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          SizedBox(
                              height: mediaQuery.size.height,
                              child: ListView.builder(itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: (){
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) =>
                                            BasketballTeamInfo(
                                                response[index]["id"].toString(),
                                                response[index]["name"].toString(),
                                                response[index]["logo"].toString(),
                                                response[index]["country"]["name"].toString()
                                            ),
                                        )
                                    );
                                  },
                                  child: SizedBox(
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
                                            response[index]["logo"].toString(),
                                          ),
                                          radius: 20,
                                        ),
                                        title: Text(response[index]["name"].toString(), style: TextStyle(color: Colors.white),),
                                        subtitle: Text(response[index]["country"]["name"].toString(), style: TextStyle(color: Colors.white),),
                                        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white,size: 22,)
                                    ),
                                  ),
                                );
                              },
                                itemCount: response.length,
                              )
                          ),
                        ],
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

  Future teamInformation() async{

    const String apiKey = "0a9ce6deb596f61f4e33463c192bd31c";

    var headers = {
      'x-rapidapi-key': apiKey,
      'x-rapidapi-host': 'https://api-basketball.p.rapidapi.com/teams'
    };

    var request = http.Request(
        'GET',
        Uri.parse('https://v1.basketball.api-sports.io/teams?season=2021-2022&league=3'));

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
