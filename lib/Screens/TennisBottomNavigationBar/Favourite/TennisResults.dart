import 'package:flutter/material.dart';

import '../TennisScoreDetailed/TennisScoreDetailed.dart';

class Results extends StatelessWidget {
  const Results({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(height: 5,),
        ListTile(
          horizontalTitleGap: 20,
          dense: true,
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
          title: Text("Angers Chat Women", style: TextStyle(color: Color(0xff9B8BFF),fontSize: 15
          ),),
        ),
        SizedBox(height: 5,),
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("S2", textAlign: TextAlign.center, style: TextStyle(color: Color(0xff9B8BFF)),),
                          Container(
                            height: 50,
                            width: 2,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                    minLeadingWidth: 60,
                    title: Text("FC Barcelona", style: TextStyle(color: Colors.white),),
                    subtitle: Text("Real Madrid", style: TextStyle(color: Colors.white),),
                    trailing: SizedBox(
                      height: 50,
                      width: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("0", style: TextStyle(color: Colors.grey),),
                              Text("1", style: TextStyle(color: Colors.grey),),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("4", style: TextStyle(color: Colors.white),),
                              Text("5", style: TextStyle(color: Colors.white),),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("0", style: TextStyle(color: Colors.grey),),
                              Text("2", style: TextStyle(color: Colors.grey),),
                            ],
                          ),
                          Icon(Icons.notifications, color: Color(0xff9B8BFF),)
                        ],
                      ),
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("S2", textAlign: TextAlign.center, style: TextStyle(color: Color(0xff9B8BFF)),),
                          Container(
                            height: 50,
                            width: 2,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                    minLeadingWidth: 60,
                    title: Text("FC Barcelona", style: TextStyle(color: Colors.white),),
                    subtitle: Text("Real Madrid", style: TextStyle(color: Colors.white),),
                    trailing: SizedBox(
                      height: 50,
                      width: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("0", style: TextStyle(color: Colors.grey),),
                              Text("1", style: TextStyle(color: Colors.grey),),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("4", style: TextStyle(color: Colors.white),),
                              Text("5", style: TextStyle(color: Colors.white),),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("0", style: TextStyle(color: Colors.grey),),
                              Text("2", style: TextStyle(color: Colors.grey),),
                            ],
                          ),
                          Icon(Icons.notifications, color: Color(0xff9B8BFF),)
                        ],
                      ),
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
