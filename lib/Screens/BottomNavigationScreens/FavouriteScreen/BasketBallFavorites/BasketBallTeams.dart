import 'package:flutter/material.dart';

import '../FootballFavoriteBody/Teams/TeamInfo/TeamInfoMainScreen.dart';

class BasketBallTeams extends StatelessWidget {
  const BasketBallTeams({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Column(
      children: [
        ListTile(
          horizontalTitleGap: 20,
          dense: true,
          title: Text("Following", style: TextStyle(color: Colors.grey.shade400,
          ),),
        ),

        SizedBox(
          height: mediaQuery.size.height*0.43,
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
                                image: AssetImage("assets/images/lakars.png"),
                                fit: BoxFit.fill
                            )
                        ),
                      ),
                      minLeadingWidth: 20,
                      title: Text("Octamdo City", style: TextStyle(color: Colors.white),),
                      trailing: Icon(Icons.notifications, color: const Color(0xff9B8BFF),)
                  ),
                ),
              ),
            );
          },
            scrollDirection: Axis.vertical,
            itemExtent: 65,
            itemCount: 5,
            physics: const NeverScrollableScrollPhysics(),
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
                                image: AssetImage("assets/images/lakars.png"),
                              fit: BoxFit.fill
                            )
                        ),
                      ),
                      minLeadingWidth: 20,
                      title: Text("Octamdo City", style: TextStyle(color: Colors.white),),
                      trailing: Icon(Icons.notifications, color: const Color(0xff9B8BFF))
                  ),
                ),
              );
            },
              scrollDirection: Axis.vertical,
              itemExtent: 65,
              itemCount: 3,
              physics: NeverScrollableScrollPhysics(),
            ),
          ),
        )

      ],
    );
  }
}
