import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:live_score_app/Getx%20Values%20Updater/Football-Images-Changer.dart';
import '../../setting_screen.dart';
import '../MatchesMenusSelections.dart';
import 'SearchIcons/FootBallSearchIcon.dart';
import 'MatchesDetailed/MatchDetailes.dart';
import 'MatchesOverviewTabBars/MatchesOverviewTabBars.dart';
import 'package:http/http.dart' as http;

class FootBallDashBoardScreen extends StatefulWidget {
  const FootBallDashBoardScreen({super.key});

  @override
  State<FootBallDashBoardScreen> createState() => _FootBallDashBoardScreenState();

}

class _FootBallDashBoardScreenState extends State<FootBallDashBoardScreen> {

  int selectedIndex = 0;

  DateTime? picked;

  List<DateTime> nextSevenDays = [];

  FootballImagesChanger imageUpdater = Get.put(FootballImagesChanger());

  List<String> imagesDashboard = [
    "assets/images/FootballdashboardImages.png",
    "assets/images/FootballdashboardImages2.png",
    "assets/images/FootballdashboardImages3.png",
  ];

  bool isLive=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNextSevenDays();
    picked = DateTime.now();
    Timer.periodic(const Duration(seconds: 30), (timer) {
      imageUpdater.imageUpdaterFunction();
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0D0D0D),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => FootballSearchIcon(),
                )
            );
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
      backgroundColor: const Color(0xff101010),
      body: Stack(
        children: [

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                color: const Color(0xff0D0D0D),
                margin: const EdgeInsets.only(
                  bottom: 10
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                height: mediaQuery.size.height*0.07,
                width: mediaQuery.size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        if(isLive==true) {
                          isLive = false;
                        }
                        else{
                          isLive = true;
                        }
                        setState(() {

                        });
                      },
                      child: Container(
                        height: 27,
                        width: 55,
                        decoration: BoxDecoration(
                          color: isLive?const Color(0xff9B8BFF):Colors.grey,
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("LIVE",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ),
                    ),

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5
                        ),
                        child: ListView.builder(itemBuilder: (context, index) {

                          // DateTime currentDate = DateTime.now().add(Duration(days: index));
                          // String formattedDay = DateFormat('E').format(currentDate);
                          //
                          // daysOfWeek.add(formattedDay);

                          return GestureDetector(
                            onTap: (){
                              setState(() {
                                selectedIndex = index;
                                picked = nextSevenDays[index];
                              });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                DateFormat("E").format(nextSevenDays[index]),
                                  // daysOfWeek[index].toString(),
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: selectedIndex == index?Colors.white:Colors.grey),),
                                Text(
                                  "${DateFormat("dd").format(nextSevenDays[index])} ${DateFormat("MMM").format(DateTime.parse(nextSevenDays[index].toString()))}",
                                  style: TextStyle(
                                      fontSize: 9,
                                      color: selectedIndex == index?Colors.white:Colors.grey),
                                ),
                              ],
                            ),
                          );
                        },
                          scrollDirection: Axis.horizontal,
                          itemExtent: 42,
                          itemCount: 7,
                        ),
                      ),
                    ),


                    IconButton(
                        onPressed: (){
                          _selectDate(context);
                        },
                        icon: const Icon(
                          Icons.calendar_month_outlined,
                          size: 25,color: Colors.white,
                        )
                    )
                  ],
                ),
              ),
              // const Divider(
              //   color: Colors.grey,
              //   thickness: 0.5,
              // ),
              SizedBox(
                height: mediaQuery.size.height*0.135,
                child: Column(
                  children: [
                    Obx(() {
                      return Container(
                        height: mediaQuery.size.height*0.11,
                        width: mediaQuery.size.width*0.9,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(imagesDashboard[int.parse(imageUpdater.imageCounter.toString())]),
                                fit: BoxFit.fill
                            ),
                            // color: Colors.grey.shade500,
                            borderRadius: BorderRadius.circular(8)
                        ),
                      );
                    }),

                    Obx(() {
                      return SizedBox(
                        height: mediaQuery.size.height*0.025,
                        width: mediaQuery.size.width*0.4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            for(int i=0;i<3;i++) SizedBox(
                              width: 30,
                              child: Divider(
                                  thickness: 2,
                                  color: i<=int.parse(imageUpdater.imageCounter.toString())?Colors.white:Colors.grey.shade800),
                            )
                          ],
                        ),
                      );
                    })
                  ],
                ),
              ),
            ],
          ),

          Positioned(
            top: mediaQuery.size.height*0.22,
            left: 0,
            right: 0,
            bottom: 50,
            child: SingleChildScrollView(
              child: SizedBox(
                height: mediaQuery.size.height*1.13,
                child: Column(
                  children: [
                    FutureBuilder(
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

                            return Column(
                              children: [
                                // SizedBox(
                                //   height: mediaQuery.size.height*0.3,
                                //   width: mediaQuery.size.width,
                                //   child: Column(
                                //     mainAxisAlignment: MainAxisAlignment.center,
                                //     children: [
                                //       ListTile(
                                //         onTap: (){
                                //           Navigator.push(context,
                                //               MaterialPageRoute(
                                //                 builder: (context) =>
                                //                     FavouriteScreen(
                                //                       selectedFavourite: 'Football',
                                //                       isBackEnabled: true,
                                //                     ),
                                //               )
                                //           );
                                //         },
                                //         leading: const Icon(Icons.notifications, color: Color(0xff9B8BFF),),
                                //         trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18,),
                                //         title: const Text("Favourite", style: TextStyle(fontSize: 15, color: Colors.white),),
                                //         dense: true,
                                //       ),
                                //       Expanded(
                                //           child: ListView.builder(itemBuilder: (context, index) {
                                //             return GestureDetector(
                                //                 onTap: (){
                                //                   Navigator.push(context,
                                //                       MaterialPageRoute(
                                //                         builder: (context) =>
                                //                             MatchDetails(isFootball: true),
                                //                       )
                                //                   );
                                //                 },
                                //                 child: ListContainersDashboard(index: index,));
                                //           },
                                //             itemExtent: 80,
                                //             itemCount: 2,
                                //             physics: const NeverScrollableScrollPhysics(),
                                //           )
                                //       ),
                                //     ],
                                //   ),
                                //
                                // ),
                                SizedBox(
                                  height: mediaQuery.size.height*0.5,
                                  width: mediaQuery.size.width,
                                  child: ListView.builder(
                                    itemBuilder: (context, index) {
                                      return Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 5,),
                                          ListTile(
                                            onTap: (){
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        MatchesOverviewTabBars(
                                                          isFootball: true,
                                                          logo: response[index]["league"]["logo"].toString(),
                                                          country: response[index]["league"]["country"].toString(),
                                                          name: response[index]["league"]["name"].toString(),
                                                          leagueID: response[index]["league"]["id"].toString(),
                                                        ),
                                                  )
                                              );
                                            },
                                            dense: true,
                                            horizontalTitleGap: 20,
                                            tileColor: Colors.transparent,
                                            leading: CircleAvatar(
                                              backgroundColor: Colors.transparent,
                                              backgroundImage: NetworkImage(
                                                  response[index]["league"]["logo"].toString()
                                              ),
                                            ),
                                            title: Text(response[index]["league"]["name"].toString(), style: const TextStyle(color: Colors.white,
                                            ),),
                                          ),
                                          const SizedBox(height: 5,),
                                          GestureDetector(
                                            onTap: (){
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) => MatchDetails(
                                                        true,
                                                        response[index]["teams"]["home"]["name"].toString(),
                                                        response[index]["teams"]["home"]["logo"].toString(),
                                                        response[index]["teams"]["away"]["name"].toString(),
                                                        response[index]["teams"]["away"]["logo"].toString(),
                                                        response[index]["goals"]["home"].toString(),
                                                        response[index]["goals"]["away"].toString(),
                                                        response[index]["fixture"]["status"]["short"].toString(),
                                                        response[index]["fixture"]["id"].toString(),
                                                        response[index]["league"]["id"].toString(),

                                                      )
                                                  )
                                              );
                                            },
                                            child: Container(
                                              width: mediaQuery.size.width,
                                              margin: const EdgeInsets.symmetric(
                                                  horizontal: 20,
                                                  vertical: 7
                                              ),
                                              decoration: BoxDecoration(
                                                  color: const Color(0xff161616),
                                                  borderRadius: BorderRadius.circular(10)
                                              ),
                                              child: Center(
                                                child: ListTile(
                                                  dense: true,
                                                  leading: SizedBox(
                                                    height: 50,
                                                    width: mediaQuery.size.width*0.18,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Column(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Text(DateFormat("HH:mm a").format(DateTime.parse(response[index]["fixture"]["date"].toString())), style: TextStyle(color:  Color(0xff9B8BFF)),),
                                                            Text(response[index]["fixture"]["status"]["short"].toString(), style: TextStyle(color: Color(0xff9B8BFF)),),
                                                          ],
                                                        ),
                                                        Container(
                                                          height: 50,
                                                          width: 2,
                                                          color: Colors.grey,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  minLeadingWidth: 50,
                                                  title: Text(response[index]["teams"]["home"]["name"].toString(), style: TextStyle(color: Colors.white),),
                                                  subtitle: Text(response[index]["teams"]["away"]["name"].toString(), style: TextStyle(color: Colors.white),),
                                                  trailing: SizedBox(
                                                    height: 50,
                                                    width: 50,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Column(
                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                          children: [
                                                            Text(response[index]["goals"]["home"].toString(), style: TextStyle(color: Colors.white, fontSize: 12),),
                                                            Text(response[index]["goals"]["away"].toString(), style: TextStyle(color: Colors.white, fontSize: 12),),
                                                          ],
                                                        ),
                                                        const Icon(Icons.notifications_outlined, color: Color(0xff9B8BFF),)
                                                      ],
                                                    ),
                                                  )
                                                ),
                                              ),
                                            ),
                                          ),

                                          // const SizedBox(height: 5,),
                                          // const ListTile(
                                          //   horizontalTitleGap: 20,
                                          //   tileColor: Color(0xff161616),
                                          //   leading: CircleAvatar(
                                          //     backgroundColor: Colors.transparent,
                                          //     radius: 16,
                                          //     backgroundImage: AssetImage("assets/images/LaLiga.png"),
                                          //   ),
                                          //   title: Text("LALIGA", style: TextStyle(color: Colors.white,
                                          //   ),),
                                          // ),
                                          // const SizedBox(height: 5,),
                                          // SizedBox(
                                          //   height: mediaQuery.size.height*0.54,
                                          //   child: ListView.builder(itemBuilder: (context, index) {
                                          //     return GestureDetector(
                                          //       onTap: (){
                                          //         Navigator.push(context, MaterialPageRoute(builder: (context) => MatchesOverviewTabBars(isFootball: false),));
                                          //       },
                                          //       child: Container(
                                          //         width: mediaQuery.size.width,
                                          //         margin: const EdgeInsets.symmetric(
                                          //             horizontal: 20,
                                          //             vertical: 7
                                          //         ),
                                          //         decoration: BoxDecoration(
                                          //             color: const Color(0xff161616),
                                          //             borderRadius: BorderRadius.circular(10)
                                          //         ),
                                          //         child: Center(
                                          //           child: ListTile(
                                          //             dense: true,
                                          //             leading: SizedBox(
                                          //               height: 50,
                                          //               width: mediaQuery.size.width*0.18,
                                          //               child: Row(
                                          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          //                 children: [
                                          //                   const Column(
                                          //                     mainAxisAlignment: MainAxisAlignment.center,
                                          //                     children: [
                                          //                       Text("8:00 AM", style: TextStyle(color: const Color(0xff9B8BFF)),),
                                          //                       Text("HT", style: TextStyle(color: const Color(0xff9B8BFF)),),
                                          //                     ],
                                          //                   ),
                                          //                   Container(
                                          //                     height: 50,
                                          //                     width: 2,
                                          //                     color: Colors.grey,
                                          //                   )
                                          //                 ],
                                          //               ),
                                          //             ),
                                          //             minLeadingWidth: 50,
                                          //             title: Text("FC Barcelona", style: TextStyle(color: Colors.white),),
                                          //             subtitle: Text("Real Madrid", style: TextStyle(color: Colors.white),),
                                          //             trailing: Text("09:00 pm", style: TextStyle(color: Colors.grey, fontSize: 12),),
                                          //           ),
                                          //         ),
                                          //       ),
                                          //     );
                                          //   },
                                          //     scrollDirection: Axis.vertical,
                                          //     itemExtent: 100,
                                          //     itemCount: 4,
                                          //     physics: NeverScrollableScrollPhysics(),
                                          //   ),
                                          // ),
                                        ],
                                      );
                                    },
                                    itemCount: response.length,
                                    physics: BouncingScrollPhysics(),
                                  ),
                                ),
                              ],
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
            ),
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
      ),
    );
  }

  Future fixtureInformation() async{

    const String apiKey = "0a9ce6deb596f61f4e33463c192bd31c";

    String url = isLive?
    "https://v3.football.api-sports.io/fixtures?live=all":
    "https://v3.football.api-sports.io/fixtures?date=${DateFormat("yyyy-MM-dd").format(DateTime.parse(picked.toString())).toString()}";

    var headers = {
      'x-rapidapi-key': apiKey,
      'x-rapidapi-host': 'https://api-football-v1.p.rapidapi.com/v3/fixtures'
    };

    var request = http.Request(
        'GET',
        Uri.parse(url)
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

  Future<void> _selectDate(BuildContext context) async {

    picked = await showDatePicker(
      context: context,
      initialDatePickerMode: DatePickerMode.year,
      barrierColor: Colors.black.withOpacity(0.8),
      initialDate: DateTime(2011),
      firstDate: DateTime(2011),
      lastDate: DateTime(2050),
    );

    if (picked != null && picked != DateTime.now()) {
      setState(() {

      });
    }
  }

  // dateBuilder(date, maxDates, index) {
  //   if(date>int.parse(maxDates)) {
  //     counter = counter+1;
  //     return counter;
  //   }
  //   else {
  //     return date;
  //   }
  // }

  getNextSevenDays() {

    DateTime today = DateTime.now();

    for (int i = 0; i < 7; i++) {
      nextSevenDays.add(today.add(Duration(days: i)));
    }
  }

}

