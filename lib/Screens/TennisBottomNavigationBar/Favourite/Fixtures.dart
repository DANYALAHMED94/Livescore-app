import 'package:flutter/material.dart';

import '../TennisScoreDetailed/TennisScoreDetailed.dart';

class Fixtures extends StatelessWidget {
  const Fixtures({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(height: 5,),
        ListTile(
          dense: true,
          horizontalTitleGap: 20,
          tileColor: const Color(0xff161616),
          leading: Container(
            height: 25,
            width: 30,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/angerschall.png"),
                    fit: BoxFit.fill
                )
            ),
          ),
          title: const Text("Angers Chat Women", style: TextStyle(color: Color(0xff9B8BFF),fontSize: 15
          ),),
        ),
        const SizedBox(height: 5,),
        SizedBox(
          height: mediaQuery.size.height*0.13,
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
                          Text("8:00 AM", style: TextStyle(color: Color(0xff9B8BFF),),),
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
                        child: Icon(Icons.notifications, color: Color(0xff9B8BFF),)
                    ),
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
        SizedBox(height: 5,),
        ListTile(
          dense: true,
          horizontalTitleGap: 20,
          tileColor: const Color(0xff161616),
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
          title: Text("Angers Chat Women", style: TextStyle(color: const Color(0xff9B8BFF),fontSize: 15
          ),),
        ),
        SizedBox(height: 5,),
        SizedBox(
          height: mediaQuery.size.height*0.66,
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
                          Text("8:00 AM", style: TextStyle(color: Color(0xff9B8BFF),),),
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
                        child: Icon(Icons.notifications, color: Color(0xff9B8BFF),)
                    ),
                  ),
                ),
              ),
            );
          },
            scrollDirection: Axis.vertical,
            itemExtent: 100,
            itemCount: 5,
            physics: NeverScrollableScrollPhysics(),
          ),
        )

      ],
    );
  }
}
