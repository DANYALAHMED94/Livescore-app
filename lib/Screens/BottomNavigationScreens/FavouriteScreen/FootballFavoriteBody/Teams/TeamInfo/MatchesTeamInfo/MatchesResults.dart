import 'package:flutter/material.dart';

import '../../../../../DashBoards/MatchesDetailed/MatchDetailes.dart';

class MatchesResults extends StatelessWidget {
  const MatchesResults({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return SizedBox(
      height: mediaQuery.size.height*1.58,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 5,),
          const ListTile(
            horizontalTitleGap: 20,
            tileColor: Color(0xff161616),
            leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage("assets/images/matches.png"),
          ),
            title: Text("UEFA COMPANION LEAGUE", style: TextStyle(color: Colors.white,
            ),),
          ),
          const SizedBox(height: 5,),
          SizedBox(
            height: mediaQuery.size.height*0.13,
            child: ListView.builder(itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MatchDetails(
                    false,
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                  ),));
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
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("8:00 AM", style: TextStyle(color: const Color(0xff9B8BFF)),),
                                Text("HT", style: TextStyle(color: const Color(0xff9B8BFF)),),
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
                      title: Text("FC Barcelona", style: TextStyle(color: Colors.white),),
                      subtitle: Text("Real Madrid", style: TextStyle(color: Colors.white),),
                      trailing: SizedBox(
                        width: mediaQuery.size.width*0.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("XI", style: TextStyle(color: Colors.grey, fontSize: 12),),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("4", style: TextStyle(color: Colors.white, fontSize: 12),),
                                Text("0", style: TextStyle(color: Colors.white, fontSize: 12),),
                              ],
                            ),

                            Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.green,
                              ),
                              child: Center(child: Text("W", style: TextStyle(color: Colors.white, fontSize: 12),)),
                            )
                          ],
                        ),
                      )
                    ),
                  ),
                ),
              );
            },
              scrollDirection: Axis.vertical,
              itemExtent: 100,
              itemCount: 1,
              physics: NeverScrollableScrollPhysics(),
            ),
          ),

          const SizedBox(height: 5,),
          const ListTile(
            horizontalTitleGap: 20,
            tileColor: const Color(0xff161616),
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 16,
              backgroundImage: AssetImage("assets/images/LaLiga.png"),
            ),
            title: Text("LALIGA", style: TextStyle(color: Colors.white,
            ),),
          ),
          const SizedBox(height: 5,),
          Container(
            height: mediaQuery.size.height*1.2,
            child: ListView.builder(itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MatchDetails(
                    false,
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                  ),));
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
                    child: index>5?ListTile(
                      dense: true,
                      leading: SizedBox(
                        height: 50,
                        width: mediaQuery.size.width*0.18,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("8:00 AM", style: TextStyle(color: const Color(0xff9B8BFF)),),
                                Text("HT", style: TextStyle(color: const Color(0xff9B8BFF)),),
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
                      title: Text("FC Barcelona", style: TextStyle(color: Colors.white),),
                      subtitle: Text("Real Madrid", style: TextStyle(color: Colors.white),),
                      trailing: Text("09:00 pm", style: TextStyle(color: Colors.grey, fontSize: 12),),
                    ): ListTile(
                        dense: true,
                        leading: SizedBox(
                          height: 50,
                          width: mediaQuery.size.width*0.18,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("8:00 AM", style: TextStyle(color: const Color(0xff9B8BFF)),),
                                  Text("HT", style: TextStyle(color: const Color(0xff9B8BFF)),),
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
                        title: Text("FC Barcelona", style: TextStyle(color: Colors.white),),
                        subtitle: Text("Real Madrid", style: TextStyle(color: Colors.white),),
                        trailing: SizedBox(
                          width: mediaQuery.size.width*0.2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("XI", style: TextStyle(color: Colors.grey, fontSize: 12),),

                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("4", style: TextStyle(color: Colors.white, fontSize: 12),),
                                  Text("0", style: TextStyle(color: Colors.white, fontSize: 12),),
                                ],
                              ),

                              Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.green,
                                ),
                                child: Center(child: Text("W", style: TextStyle(color: Colors.white, fontSize: 12),)),
                              )

                            ],
                          ),
                        )
                    )
                  ),
                ),
              );
            },
              scrollDirection: Axis.vertical,
              itemExtent: 100,
              itemCount: 9,
              physics: NeverScrollableScrollPhysics(),
            ),
          ),
        ],
      ),
    );
  }
}
