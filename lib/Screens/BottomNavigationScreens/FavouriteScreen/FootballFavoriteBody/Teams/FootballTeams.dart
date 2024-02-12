import 'package:flutter/material.dart';

import 'TeamInfo/TeamInfoMainScreen.dart';

class FootballTeams extends StatelessWidget {
  const FootballTeams({super.key});

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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>
                        TeamInfoMainScreen(
                            "",
                            "",
                            "",
                            ""
                        ),));
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
                      leading: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage("assets/images/FC-Barcelona.png"),
                      ),
                      minLeadingWidth: 15,
                      title: Text("FC Barcelona", style: TextStyle(color: Colors.white),),
                      trailing: Icon(Icons.notifications, color: Color(0xff9B8BFF),)
                  ),
                ),
              ),
            );
          },
            scrollDirection: Axis.vertical,
            itemExtent: 65,
            itemCount: 5,
            physics: NeverScrollableScrollPhysics(),
          ),
        ),

        ListTile(
          horizontalTitleGap: 20,
          dense: true,
          title: Text("Suggested", style: TextStyle(color: Colors.grey.shade400,
          ),),
        ),

        SizedBox(
          height: mediaQuery.size.height*1.025,
          child: ListView.builder(itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>
                        TeamInfoMainScreen(
                            "",
                            "",
                            "",
                            ""
                        ),));
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
                      leading: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage("assets/images/FC-Barcelona.png"),
                      ),
                      minLeadingWidth: 20,
                      title: Text("FC Barcelona", style: TextStyle(color: Colors.white),),
                      trailing: Icon(Icons.notifications_outlined, color: Color(0xff9B8BFF),)
                  ),
                ),
              ),
            );
          },
            scrollDirection: Axis.vertical,
            itemExtent: 65,
            itemCount: 12,
            physics: NeverScrollableScrollPhysics(),
          ),
        )

      ],
    );
  }
}
