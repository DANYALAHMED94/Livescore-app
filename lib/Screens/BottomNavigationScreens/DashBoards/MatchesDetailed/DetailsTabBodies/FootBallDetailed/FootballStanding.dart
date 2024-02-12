import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class F_Standing extends StatefulWidget {
  bool isShow;
  String leagueId;
  F_Standing({super.key, required this.isShow, required this.leagueId});

  @override
  State<F_Standing> createState() => _F_StandingState();
}

class _F_StandingState extends State<F_Standing> {
  int selectedMain = 1;

  int selectedSub = 0;

  List<String> mainList = [
    "H",
    "All",
    "A"
  ];

  List<String> mainSubList = [
    "F",
    "C"
  ];

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return FutureBuilder(
        future: fixtureInformation(),
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
            var standingInfo = response[0]["league"]["standings"][0];

            // return Text(standingInfo.toString(), style: TextStyle(fontSize: 12, color: Colors.white),);

            return SingleChildScrollView(
              child: SizedBox(
                height: mediaQuery.size.height*1.245,
                width: mediaQuery.size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          widget.isShow==true?SizedBox(
                            width: mediaQuery.size.width*0.42,
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: mediaQuery.size.width*0.42,
                                  child: ListView.builder(itemBuilder: (context, index) {
                                    return Container(
                                      height: 30,
                                      width: 40,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5,
                                          vertical: 5
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 3,
                                        vertical: 3,
                                      ),
                                      decoration: BoxDecoration(
                                        color: selectedMain == index? const Color(0xff9B8BFF): Colors.black,
                                        borderRadius: BorderRadius.circular(8),
                                        // border: Border(
                                        //   bottom: BorderSide(
                                        //     color: Colors.grey.shade300,
                                        //     width: 2,
                                        //     style: BorderStyle.solid
                                        //   )
                                        // )
                                      ),
                                      child: Center(
                                          child: Text(mainList[index],
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w900,
                                                color: Colors.white
                                            ),
                                          )
                                      ),
                                    );
                                  },
                                    scrollDirection: Axis.horizontal,
                                    itemCount: mainList.length,
                                    physics: NeverScrollableScrollPhysics(),
                                  ),
                                )
                              ],
                            ),
                          ):SizedBox(width: mediaQuery.size.width*0.42, height: 50,),
                          SizedBox(
                            width: mediaQuery.size.width*0.22,
                          ),
                          SizedBox(
                            width: mediaQuery.size.width*0.3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                    height: 50,
                                    width: mediaQuery.size.width*0.3,
                                    child: ListView.builder(itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            selectedSub = index;
                                          });
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 40,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 5,
                                              vertical: 5
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 3,
                                            vertical: 3,
                                          ),
                                          decoration: BoxDecoration(
                                              color: selectedSub == index? const Color(0xff9B8BFF): Colors.black,
                                              borderRadius: BorderRadius.circular(8)
                                          ),
                                          child: Center(
                                              child: Text(mainSubList[index],
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w900,
                                                    color: Colors.white
                                                ),
                                              )
                                          ),
                                        ),
                                      );
                                    },
                                      itemCount: mainSubList.length,
                                      scrollDirection: Axis.horizontal,
                                      physics: NeverScrollableScrollPhysics(),
                                    )
                                )
                              ],
                            ),
                          ),
                        ],
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          selectedSub == 0?Container(
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.grey.shade300,
                                      width: 1
                                  )
                              ),
                            ),
                            child: ListTile(
                              dense: true,
                              title: const Text("Teams", style: TextStyle(color: Colors.white,fontSize: 15),),
                              leading: const Text("#", style: TextStyle(color: Colors.white, fontSize: 15),),
                              minLeadingWidth: 10,
                              trailing: SizedBox(
                                width: mediaQuery.size.width*0.05,
                                child: const Text("F", style: TextStyle(color: Colors.white,fontSize: 15),),
                              ),
                            ),
                          ):Container(
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.grey.shade300,
                                      width: 1
                                  )
                              ),
                            ),
                            child: ListTile(
                              dense: true,
                              title: const Text("Teams", style: TextStyle(color: Colors.white,fontSize: 15),),
                              leading: const Text("#", style: TextStyle(color: Colors.white, fontSize: 15),),
                              minLeadingWidth: 10,
                              trailing: SizedBox(
                                  width: mediaQuery.size.width*0.3,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("P", style: TextStyle(color: Colors.white,fontSize: 15),),
                                      const Text("GD", style: TextStyle(color: Colors.white,fontSize: 15),),
                                      const Text("PTS", style: TextStyle(color: Colors.white,fontSize: 15),),
                                    ],
                                  )
                              ),
                            ),
                          ),
                          SizedBox(
                            height: mediaQuery.size.height*1.1,
                            child: ListView.builder(itemBuilder: (context, index) {
                              return tabCards(
                                index,
                                context,
                                standingInfo[index]["team"]["name"].toString(),
                                standingInfo[index]["team"]["logo"].toString(),
                                standingInfo[index]["points"].toString(),
                                standingInfo[index]["goalsDiff"].toString(),
                                standingInfo[index]["rank"].toString(),
                                standingInfo[index]["form"].toString(),

                              );
                            },
                              itemCount: standingInfo.length,
                              itemExtent: 50,
                              physics: NeverScrollableScrollPhysics(),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
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

  Widget tabCards(
      int index,
      BuildContext context,
      String teamName,
      String teamLogo,
      String gdValue,
      String pValue,
      String ptsValue,
      String form
      )
  {
    var mediaQuery = MediaQuery.of(context);
    return Container(
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
                color: Colors.grey.shade300,
                width: 1
            )
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          index%3==0?Container(
            height: 30,
            width: 8,
            margin: const EdgeInsets.symmetric(
                horizontal: 5
            ),
            color: Colors.blue.shade700,
          ):Container(
            height: 30,
            width: 8,
            margin: const EdgeInsets.symmetric(
                horizontal: 5
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("${index+1}", style: const TextStyle(color: Colors.white,fontSize: 15),),
          ),
          selectedSub==1 ? SizedBox(
            width: mediaQuery.size.width*0.8,
            child: ListTile(
              dense: true,
              title: Text(teamName.toString(), style: TextStyle(color: Colors.white,fontSize: 12),),
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(
                  teamLogo.toString()
                ),
                radius: 15,
              ),
              minLeadingWidth: 5,
              trailing: SizedBox(
                width: mediaQuery.size.width*0.3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(pValue.toString(), style: TextStyle(color: Colors.white,fontSize: 12),),
                    Text(gdValue.toString(), style: TextStyle(color: Colors.white, fontSize: 12),),
                    Text(ptsValue.toString(), style: TextStyle(color: Colors.white, fontSize: 12),),
                  ],
                ),
              ),
            ),
          ) : SizedBox(
            width: mediaQuery.size.width*0.8,
            child: ListTile(
              dense: true,
              title: Text(teamName, style: TextStyle(color: Colors.white,fontSize: 12),),
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(
                  teamLogo.toString()
                ),
                radius: 15,
              ),
              minLeadingWidth: 5,
              trailing: SizedBox(
                width: mediaQuery.size.width*0.3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 25,
                      width: 25,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 1
                      ),
                      decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.horizontal(
                            // right: Radius.circular(10),
                            left: Radius.circular(8)
                          )
                      ),
                      child: Center(
                        child: Text(form.substring(0,1), style: TextStyle(fontSize: 12),),
                      ),

                    ),
                    Container(
                      height: 25,
                      width: 25,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 1
                      ),
                      decoration: const BoxDecoration(
                          color: Colors.green,
                          // borderRadius: BorderRadius.horizontal(
                          //   // right: Radius.circular(10),
                          //     left: Radius.circular(5)
                          // )
                      ),
                      child: Center(
                        child: Text(form.substring(1,2), style: TextStyle(fontSize: 12),),
                      ),

                    ),
                    Container(
                      height: 25,
                      width: 25,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 1
                      ),
                      decoration: const BoxDecoration(
                          color: Colors.green,
                          // borderRadius: BorderRadius.horizontal(
                          //   // right: Radius.circular(10),
                          //     left: Radius.circular(5)
                          // )
                      ),
                      child: Center(
                        child: Text(form.substring(2,3), style: TextStyle(fontSize: 12),),
                      ),

                    ),
                    Container(
                      height: 25,
                      width: 25,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 1
                      ),
                      decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(8),
                          )
                      ),
                      child: Center(
                        child: Text(form.substring(3,4), style: TextStyle(fontSize: 12),),
                      ),

                    ),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future fixtureInformation() async{

    const String apiKey = "0a9ce6deb596f61f4e33463c192bd31c";

    var headers = {
      'x-rapidapi-key': apiKey,
      'x-rapidapi-host': 'https://api-football-v1.p.rapidapi.com/v3/standings'
    };
    var request = http.Request(
        'GET',
        Uri.parse('https://v3.football.api-sports.io/standings?league=${widget.leagueId}&season=2021')
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
