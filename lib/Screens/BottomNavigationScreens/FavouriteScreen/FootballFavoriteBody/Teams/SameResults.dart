import 'package:flutter/material.dart';

import '../../../../TennisBottomNavigationBar/TennisScoreDetailed/TennisScoreDetailed.dart';

class SameResults extends StatelessWidget {
  const SameResults({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(height: 5,),
          const ListTile(
            horizontalTitleGap: 20,
            dense: true,
            // tileColor: Color(0xff0D0D0D),
            title: Text("Today", style: TextStyle(color: Colors.white,fontSize: 18),),
          ),
          SizedBox(height: 5,),
          SizedBox(
            height: mediaQuery.size.height*0.4,
            child: ListView.builder(itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TennisScoreDetailed(),));
                },
                child: Container(
                  width: mediaQuery.size.width,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 7
                  ),
                  decoration: BoxDecoration(
                      color: const Color(0xff0D0D0D),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: ListTile(
                      dense: true,
                      leading: SizedBox(
                        width: mediaQuery.size.width*0.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("11:00 am", textAlign: TextAlign.center, style: TextStyle(color: Color(0xff9B8BFF)),),
                                Text("FT", textAlign: TextAlign.center, style: TextStyle(color: Color(0xff9B8BFF)),),
                              ],
                            ),
                            Container(
                              height: 50,
                              width: 1.5,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ),
                      minLeadingWidth: 0,
                      title: Text("FC Barcelona", style: TextStyle(color: Colors.white),),
                      subtitle: Text("Real Madrid", style: TextStyle(color: Colors.white),),
                      trailing: SizedBox(
                          width: mediaQuery.size.width*0.18,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("135", style: TextStyle(color: Colors.grey, fontSize: 12),),
                                  Text("140", style: TextStyle(color: Colors.grey, fontSize: 12),),
                                ],
                              ),
                              Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(5)
                                ),
                                child: const Center(
                                  child: Text("W", style: TextStyle(
                                    color: Colors.white,

                                  ),),
                                ),
                              )
                            ],
                          )
                      )
                    ),
                  ),
                ),
              );
            },
              scrollDirection: Axis.vertical,
              itemExtent: 100,
              itemCount: 3,
              physics: NeverScrollableScrollPhysics(),
            ),
          ),
          SizedBox(height: 5,),
          const ListTile(
            horizontalTitleGap: 20,
            dense: true,
            // tileColor: Color(0xff0D0D0D),
            title: Text("Tomorrow", style: TextStyle(color: Colors.white,fontSize: 18),),
          ),
          SizedBox(height: 5,),
          SizedBox(
            height: mediaQuery.size.height*0.4,
            child: ListView.builder(itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TennisScoreDetailed(),));
                },
                child: Container(
                  width: mediaQuery.size.width,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 7
                  ),
                  decoration: BoxDecoration(
                      color: const Color(0xff0D0D0D),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: ListTile(
                        dense: true,
                        leading: SizedBox(
                          width: mediaQuery.size.width*0.2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("11:00 am", textAlign: TextAlign.center, style: TextStyle(color: Color(0xff9B8BFF)),),
                                  Text("FT", textAlign: TextAlign.center, style: TextStyle(color: Color(0xff9B8BFF)),),
                                ],
                              ),
                              Container(
                                height: 50,
                                width: 1.5,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                        minLeadingWidth: 0,
                        title: Text("FC Barcelona", style: TextStyle(color: Colors.white),),
                        subtitle: Text("Real Madrid", style: TextStyle(color: Colors.white),),
                        trailing: SizedBox(
                            width: mediaQuery.size.width*0.18,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("135", style: TextStyle(color: Colors.grey, fontSize: 12),),
                                    Text("140", style: TextStyle(color: Colors.grey, fontSize: 12),),
                                  ],
                                ),
                                Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(5)
                                  ),
                                  child: const Center(
                                    child: Text("W", style: TextStyle(
                                      color: Colors.white,

                                    ),),
                                  ),
                                )
                              ],
                            )
                        )
                    ),
                  ),
                ),
              );
            },
              scrollDirection: Axis.vertical,
              itemExtent: 100,
              itemCount: 3,
              physics: NeverScrollableScrollPhysics(),
            ),
          ),
        ],
      ),
    );
  }
}
