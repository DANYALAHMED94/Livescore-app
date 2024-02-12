import 'package:flutter/material.dart';

import '../../DashBoards/MatchesDetailed/MatchDetailes.dart';

class BasketBallMatches extends StatelessWidget {
  const BasketBallMatches({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(height: 5,),
        const ListTile(
          horizontalTitleGap: 20,
          tileColor: Color(0xff161616),
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage("assets/images/NBA-logo.png"),
            radius: 20,
          ),
          title: Text("UEFA COMPANION LEAGUE", style: TextStyle(color: Color(0xff9B8BFF),
          ),),
        ),
        const SizedBox(height: 5,),
        SizedBox(
          height: mediaQuery.size.height*0.4,
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
                        height: 50,
                        width: 40,
                        child: Icon(Icons.notifications, color: const Color(0xff9B8BFF),)
                    ),
                  ),
                ),
              ),
            );
          },
            scrollDirection: Axis.vertical,
            itemExtent: 100,
            itemCount: 3,
          ),
        ),
      ],
    );
  }
}
