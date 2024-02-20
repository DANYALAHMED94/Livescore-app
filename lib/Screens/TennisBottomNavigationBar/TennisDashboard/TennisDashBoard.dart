import 'package:flutter/material.dart';
import '../../../Widgets/S2CardsTennis.dart';
import '../../BottomNavigationScreens/MatchesMenusSelections.dart';
import '../../BottomNavigationScreens/DashBoards/SearchIcons/FootBallSearchIcon.dart';
import '../../setting_screen.dart';
import '../Favourite/TennisFavouriteScreens.dart';
import '../TennisScoreDetailed/TennisScoreDetailed.dart';
import 'MainCardsClickedScreen/MainCardsClickTennis.dart';

class TennisDashBoardScreen extends StatefulWidget {
  const TennisDashBoardScreen({super.key});

  @override
  State<TennisDashBoardScreen> createState() => _TennisDashBoardScreenState();
}

class _TennisDashBoardScreenState extends State<TennisDashBoardScreen> {
  int selectedDateTime=0;

  int selectedImageLevel=0;

  List<String> imagesDashboard = [
    "assets/images/tennisDashboardImage1.png",
    "assets/images/tennisDashboardImage2.png",
    "assets/images/tennisDashboardImage3.png",
  ];

  bool isLive=false;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
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
                Text("\tTENNIS", style: TextStyle(color: Colors.white, fontSize: 13),),
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
                    horizontal: 12
                ),
                height: mediaQuery.size.height*0.07,
                width: mediaQuery.size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        if(isLive==true){
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
                          return GestureDetector(
                            onTap: (){
                              setState(() {
                                selectedDateTime = index;
                              });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Sun",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: selectedDateTime == index?Colors.white:Colors.grey),),
                                Text("28 Oct",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: selectedDateTime == index?Colors.white:Colors.grey),),
                              ],
                            ),
                          );
                        },
                          scrollDirection: Axis.horizontal,
                          itemExtent: 42,
                          itemCount: 10,
                        ),
                      ),
                    ),
                    const Icon(Icons.calendar_month_outlined, size: 25,color: Colors.white,)
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
                    GestureDetector(
                      onTap: (){
                        if(selectedImageLevel==2){
                          setState(() {
                            selectedImageLevel = 0;
                          });
                        }
                        else{
                          setState(() {
                            selectedImageLevel = selectedImageLevel+1;
                          });
                        }
                      },
                      child: Container(
                        height: mediaQuery.size.height*0.11,
                        width: mediaQuery.size.width*0.9,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(imagesDashboard[selectedImageLevel]),
                                fit: BoxFit.fill
                            ),
                            // color: Colors.grey.shade500,
                            borderRadius: BorderRadius.circular(8)
                        ),
                      ),
                    ),
                    SizedBox(
                      height: mediaQuery.size.height*0.025,
                      width: mediaQuery.size.width*0.4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for(int i=0;i<3;i++) SizedBox(
                            width: 30,
                            child: Divider(
                                thickness: 2,
                                color: i<=selectedImageLevel?Colors.white:Colors.grey.shade800),
                          )
                        ],
                      ),
                    )
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
                height: mediaQuery.size.height*1.2,
                child: Column(
                  children: [
                    Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ListTile(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => TennisFavouriteScreen(isBack: true),));
                              },
                              leading: Icon(Icons.notifications, color: Color(0xff9B8BFF)),
                              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18,),
                              title: Text("Favourite", style: TextStyle(fontSize: 15, color: Colors.white),),
                              dense: true,
                            ),
                            Expanded(
                                child: ListView.builder(itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => TennisScoreDetailed(),));
                                    },
                                    child: S2CardsTennis(index: index,),
                                  );
                                },
                                  itemExtent: 80,
                                  itemCount: 2,
                                  physics: const NeverScrollableScrollPhysics(),
                                )
                            ),

                          ],
                        ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListTile(
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) =>
                                      MainCardsClickedScreens(),));
                            },
                            leading: Container(
                              height: 25,
                              width: 30,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/angerschall.png"),
                                      fit: BoxFit.fill
                                  )
                              ),
                            ),
                            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18,),
                            title: Text("Angers, Challs Women", style: TextStyle(fontSize: 15, color: Colors.white),),
                            dense: true,
                          ),
                          Expanded(
                              child: ListView.builder(itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => TennisScoreDetailed(),));
                                  },
                                  child: S2CardsTennis(index: index,),
                                );
                              },
                                itemExtent: 80,
                                itemCount: 2,
                                physics: const NeverScrollableScrollPhysics(),
                              )
                          ),

                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListTile(
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) =>
                                      MainCardsClickedScreens(),));
                            },
                            leading: Container(
                              height: 25,
                              width: 30,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/angerschall.png"),
                                  fit: BoxFit.fill
                                )
                              ),
                            ),
                            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18,),
                            title: Text("Angers, Challs Women", style: TextStyle(fontSize: 15, color: Colors.white),),
                            dense: true,
                          ),
                          Expanded(
                              child: ListView.builder(itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => TennisScoreDetailed(),));
                                  },
                                  child: S2CardsTennis(index: index,),
                                );
                              },
                                itemExtent: 80,
                                itemCount: 2,
                                physics: const NeverScrollableScrollPhysics(),
                              )
                          ),

                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListTile(
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) =>
                                      MainCardsClickedScreens(),));
                            },
                            leading: Container(
                              height: 25,
                              width: 30,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/angerschall.png"),
                                      fit: BoxFit.fill
                                  )
                              ),
                            ),
                            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18,),
                            title: Text("Angers, Challs Women", style: TextStyle(fontSize: 15, color: Colors.white),),
                            dense: true,
                          ),
                          Expanded(
                              child: ListView.builder(itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => TennisScoreDetailed(),));
                                  },
                                  child: S2CardsTennis(index: index,),
                                );
                              },
                                itemExtent: 80,
                                itemCount: 2,
                                physics: const NeverScrollableScrollPhysics(),
                              )
                          ),

                        ],
                      ),
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
}
