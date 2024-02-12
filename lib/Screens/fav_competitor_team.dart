import 'dart:convert';
import 'package:flutter/material.dart';
import 'BottomNavigationScreens/MainScreen.dart';
import 'package:http/http.dart' as http;

class FavouriteCompetitorTeamScreen extends StatelessWidget {
  const FavouriteCompetitorTeamScreen({super.key});

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

                // FutureBuilder(
                //   future: leagueInformation(),
                //   builder: (context, snapshot) {
                //     if(snapshot.connectionState == ConnectionState.waiting) {
                //       return const Center(
                //         child: CircularProgressIndicator(
                //           color: Colors.white,
                //           backgroundColor: Colors.grey,
                //         ),
                //       );
                //     }
                //     else if(snapshot.hasData) {
                //
                //       var mapData = jsonDecode(snapshot.data.toString());
                //       var response = mapData["response"];
                //
                //       return SizedBox(
                //         height: MediaQuery.of(context).size.height*2,
                //         child: ListView.builder(
                //           itemBuilder: (context, index) {
                //             return FavTeamList(
                //               response[index]["league"]["name"].toString(),
                //               response[index]["league"]["logo"].toString(),
                //             );
                //           },
                //           itemCount: response.length,
                //           physics: const BouncingScrollPhysics(),
                //         ),
                //       );
                //     }
                //     else{
                //       return const Text("Sorry Their is an Server Issue Occurring",
                //         style: TextStyle(fontSize: 12, color: Colors.white),
                //       );
                //     }
                //   },
                // ),

                const SizedBox(height: 16),

              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(
                    Color(0xff9B8BFF),
                  ),
                  shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)))),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            MainScreen(gameChoice: "Football",)));
              },
              child: const Text(
                'Save',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
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

class FavTeamList extends StatelessWidget {
  String leagueName, leagueLogo;

  FavTeamList(this.leagueName, this.leagueLogo);

  @override
  Widget build(BuildContext context) {
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
          // subtitle: Text(
          //   'Category',
          //   style: TextStyle(color: Colors.grey[500]),
          // ),
          trailing: Icon(
            Icons.notifications_outlined,
            color: Color(0xff9B8BFF),
          ),
        ),
      ),
    );
  }
}
