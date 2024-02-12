import 'dart:convert';
import 'package:flutter/material.dart';
import 'fav_competitor_team.dart';
import 'package:http/http.dart' as http;

class FavouriteTeamScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff101010),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 32),
              const Text(
                'Let\'s Get You Started!',
                style: TextStyle(
                    fontSize: 20, color: Color(0xffDADADA), fontFamily: 'lucky'),
              ),
              const SizedBox(height: 8),
              const Text(
                'Pick Your Favourite Teams To Follow',
                style: TextStyle(
                    fontSize: 20, color: Color(0xffDADADA), fontFamily: 'lucky'),
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
              //     future: teamInformation(),
              //     builder: (context, snapshot) {
              //       if(snapshot.connectionState == ConnectionState.waiting) {
              //         return const Center(
              //           child: CircularProgressIndicator(
              //             color: Colors.white,
              //             backgroundColor: Colors.grey,
              //           ),
              //         );
              //       }
              //       else if(snapshot.hasData) {
              //
              //         var mapData = jsonDecode(snapshot.data.toString());
              //         var response = mapData["response"];
              //
              //         return SizedBox(
              //           height: MediaQuery.of(context).size.height*0.6,
              //           child: ListView.builder(
              //             itemBuilder: (context, index) {
              //               return FavTeamList(
              //                 response[index]["team"]["name"].toString(),
              //                 response[index]["team"]["logo"].toString(),
              //                 response[index]["team"]["country"].toString(),
              //               );
              //             },
              //             itemCount: response.length,
              //             physics: const BouncingScrollPhysics(),
              //           ),
              //         );
              //       }
              //       else{
              //         return const Text("Sorry Their is an Server Issue Occurring",
              //           style: TextStyle(fontSize: 12, color: Colors.white),
              //         );
              //       }
              //     },
              // ),

            ],
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
                // Add your logic for the 'Next' button
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            FavouriteCompetitorTeamScreen()));
              },
              child: const Text(
                'Next',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future teamInformation() async{

    const String apiKey = "0a9ce6deb596f61f4e33463c192bd31c";

    var headers = {
      'x-rapidapi-key': apiKey,
      'x-rapidapi-host': 'https://api-football-v1.p.rapidapi.com/v3/teams'
    };
    var request = http.Request(
        'GET',
        Uri.parse('https://v3.football.api-sports.io/teams?league=39&season=2021')
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

  String teamName, teamLogo, teamCountry;

  FavTeamList(this.teamName, this.teamLogo, this.teamCountry);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      color: const Color(0xff161616),
      child: ListTile(
        dense: true,
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: NetworkImage(
            teamLogo.toString()
          )
        ),
        title: Text(
          teamName.toString(),
          style: const TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          teamCountry.toString(),
          style: TextStyle(color: Colors.grey[500]),
        ),
        trailing: const Icon(
          Icons.notifications_outlined,
          color: Color(0xff9B8BFF),
        ),
      ),
    );
  }
}
