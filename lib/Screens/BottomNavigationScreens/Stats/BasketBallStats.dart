import 'package:flutter/material.dart';

import '../../setting_screen.dart';
import '../MatchesMenusSelections.dart';
import '../FootBallSearchIcon.dart';
import 'SubScreensStats/BasketBallSubStats/BasketballMainStatsSubScreen.dart';

class BasketBallStats extends StatelessWidget {
  const BasketBallStats({super.key});

  @override
  Widget build(BuildContext context) {

    var mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: const Color(0xff101010),
      appBar: AppBar(
        backgroundColor: const Color(0xff0D0D0D),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>
                const FootballSearchIcon(),));
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
          onTap: (){
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
                Text("\tBASKETBALL", style: TextStyle(color: Colors.white, fontSize: 13),),
                Icon(Icons.arrow_drop_down, color: Colors.white,size: 25,)
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 30,
              padding: const EdgeInsets.only(
                  top: 5,
                  left: 20
              ),
              margin: const EdgeInsets.symmetric(
                  vertical: 10
              ),
              width: mediaQuery.size.width,
              color: Colors.grey.shade300,
              child: const Text("Top Competitions", style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
            ),

            SizedBox(
                height: mediaQuery.size.height*0.765,
                child: ListView.separated(itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>
                              BasketBallMainSubStatsScreens(),)
                      );
                    },
                    child: SizedBox(
                      height: 50,
                      width: mediaQuery.size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ListTile(
                              dense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              leading: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                backgroundImage: AssetImage("assets/images/nbateam.png"),
                                radius: 18,
                              ),
                              title: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("NBA", style: TextStyle(color: Colors.white),),
                                ],
                              ),
                              trailing: IconButton(
                                  onPressed: (){
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) =>
                                            BasketBallMainSubStatsScreens(),)
                                    );
                                  },
                                  icon: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18,)
                              )
                          ),
                        ],
                      )
                    ),
                  );
                },
                  separatorBuilder: (context, index) => Divider(thickness: 0.5,),
                  itemCount: 9,
                  physics: NeverScrollableScrollPhysics(),
                )
            ),

            Container(
              height: 30,
              padding: const EdgeInsets.only(
                  top: 5,
                  left: 20
              ),
              margin: const EdgeInsets.symmetric(
                  vertical: 10
              ),
              width: mediaQuery.size.width,
              color: Colors.grey.shade300,
              child: const Text("Top Competitions", style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
            ),

            SizedBox(
                height: mediaQuery.size.height*0.765,
                child: ListView.separated(itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>
                              BasketBallMainSubStatsScreens(),)
                      );
                    },
                    child: SizedBox(
                        height: 50,
                        width: mediaQuery.size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ListTile(
                                dense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                leading: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: AssetImage("assets/images/nbateam.png"),
                                  radius: 18,
                                ),
                                title: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("NBA", style: TextStyle(color: Colors.white),),
                                  ],
                                ),
                                trailing: IconButton(
                                    onPressed: (){
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) =>
                                              BasketBallMainSubStatsScreens(),)
                                      );
                                    },
                                    icon: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18,)
                                )
                            ),
                          ],
                        )
                    ),
                  );
                },
                  separatorBuilder: (context, index) => Divider(thickness: 0.5,),
                  itemCount: 9,
                  physics: NeverScrollableScrollPhysics(),
                )
            ),

            Container(
              height: 30,
              padding: const EdgeInsets.only(
                  top: 5,
                  left: 20
              ),
              margin: const EdgeInsets.symmetric(
                  vertical: 10
              ),
              width: mediaQuery.size.width,
              color: Colors.grey.shade300,
              child: const Text("Top Competitions", style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
            ),

            SizedBox(
                height: mediaQuery.size.height*0.765,
                child: ListView.separated(itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>
                              BasketBallMainSubStatsScreens(),)
                      );
                    },
                    child: SizedBox(
                        height: 50,
                        width: mediaQuery.size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ListTile(
                                dense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                leading: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: AssetImage("assets/images/nbateam.png"),
                                  radius: 18,
                                ),
                                title: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("NBA", style: TextStyle(color: Colors.white),),
                                  ],
                                ),
                                trailing: IconButton(
                                    onPressed: (){
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) =>
                                              BasketBallMainSubStatsScreens(),)
                                      );
                                    },
                                    icon: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18,)
                                )
                            ),
                          ],
                        )
                    ),
                  );
                },
                  separatorBuilder: (context, index) => Divider(thickness: 0.5,),
                  itemCount: 9,
                  physics: NeverScrollableScrollPhysics(),
                )
            ),
          ],
        ),
      ),
    );
  }
}
