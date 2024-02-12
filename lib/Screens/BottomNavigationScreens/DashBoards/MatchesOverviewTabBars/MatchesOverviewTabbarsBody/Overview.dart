import 'package:flutter/material.dart';

import '../../MatchesDetailed/MatchDetailes.dart';

class OverViewBody extends StatelessWidget {
  int selection;
  bool isFootball;
  OverViewBody({super.key,required this.selection,required this.isFootball});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return SizedBox(
      height:  mediaQuery.size.height*1.27,
      child: Stack(
        children: [
          Positioned(
            top: mediaQuery.size.height*0.07,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SingleChildScrollView(
                    child: SizedBox(
                      height: mediaQuery.size.height*1.2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: mediaQuery.size.width,
                              height: mediaQuery.size.height*0.38,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const ListTile(
                                    title: Text("Today", style: TextStyle(fontSize: 18, color: Colors.white),),
                                    dense: true,
                                  ),
                                  Expanded(
                                      child: ListView.builder(itemBuilder: (context, index) {
                                        return GestureDetector(
                                            onTap: (){
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        MatchDetails(
                                                          false,
                                                          "",
                                                          "",
                                                          "",
                                                          "",
                                                          "",
                                                          "",
                                                          "",
                                                          "",
                                                        ),
                                                  )
                                              );
                                            },
                                            child: cardsBuilder(index));
                                      },
                                        itemExtent: 80,
                                        itemCount: 3,
                                        physics: const NeverScrollableScrollPhysics(),
                                      )
                                  ),
                                ],
                              )
                          ),
                          SizedBox(
                              width: mediaQuery.size.width,
                              height: mediaQuery.size.height*0.195,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const ListTile(
                                    subtitle: Text("Group E", style: TextStyle(fontSize: 12, color: Colors.white),),
                                    title: Text("Today", style: TextStyle(fontSize: 18, color: Colors.white),),
                                    dense: true,
                                  ),
                                  Expanded(
                                      child: ListView.builder(itemBuilder: (context, index) {
                                        return GestureDetector(
                                            onTap: (){
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        MatchDetails(
                                                          false,
                                                          "",
                                                          "",
                                                          "",
                                                          "",
                                                          "",
                                                          "",
                                                          "",
                                                          "",
                                                        ),
                                                  )
                                              );
                                            },
                                            child: cardsBuilder(index));
                                      },
                                        itemExtent: 80,
                                        itemCount: 3,
                                        physics: const NeverScrollableScrollPhysics(),
                                      )
                                  ),
                                ],
                              )
                          ),
                          SizedBox(
                              width: mediaQuery.size.width,
                              height: mediaQuery.size.height*0.195,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const ListTile(
                                    subtitle: Text("Group E", style: TextStyle(fontSize: 12, color: Colors.white),),
                                    title: Text("Today", style: TextStyle(fontSize: 18, color: Colors.white),),
                                    dense: true,
                                  ),
                                  Expanded(
                                      child: ListView.builder(itemBuilder: (context, index) {
                                        return GestureDetector(
                                            onTap: (){
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        MatchDetails(
                                                          false,
                                                          "",
                                                          "",
                                                          "",
                                                          "",
                                                          "",
                                                          "",
                                                          "",
                                                          "",
                                                        ),
                                                  )
                                              );
                                            },
                                            child: cardsBuilder(index));
                                      },
                                        itemExtent: 80,
                                        itemCount: 3,
                                        physics: const NeverScrollableScrollPhysics(),
                                      )
                                  ),
                                ],
                              )
                          ),
                          SizedBox(
                              width: mediaQuery.size.width,
                              height: mediaQuery.size.height*0.38,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const ListTile(
                                    title: Text("Tomorrow", style: TextStyle(fontSize: 18, color: Colors.white),),
                                    dense: true,
                                  ),
                                  Expanded(
                                      child: ListView.builder(itemBuilder: (context, index) {
                                        return GestureDetector(
                                            onTap: (){
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        MatchDetails(
                                                          false,
                                                          "",
                                                          "",
                                                          "",
                                                          "",
                                                          "",
                                                          "",
                                                          "",
                                                          ""
                                                        ),
                                                  )
                                              );
                                            },
                                            child: cardsBuilder(index));
                                      },
                                        itemExtent: 80,
                                        itemCount: 3,
                                        physics: const NeverScrollableScrollPhysics(),
                                      )
                                  ),
                                ],
                              )
                          ),
                        ],
                      )
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget cardsBuilder(int index) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff0D0D0D),
        borderRadius: BorderRadius.circular(8)
      ),
      margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5
      ),
      child: ListTile(
        leading: SizedBox(
          height: 50,
          width: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("8:00 AM", style: TextStyle(color: Color(0xff9B8BFF)),),
                  selection==0?Text("FT", style: TextStyle(color: Color(0xff9B8BFF)),):SizedBox()
                ],
              ),
              const SizedBox(width: 10,),
              Container(
                height: 50,
                width: 1,
                color: Colors.grey.shade600,
              )
            ],
          ),
        ),
        minLeadingWidth: 30,
        title: Text("FC Barcelona", style: TextStyle(color: Colors.white),),
        subtitle: Text("Real Madrid", style: TextStyle(color: Colors.white),),
        trailing: SizedBox(
          height: 50,
          width: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  selection==0?Text("4", style: TextStyle(color: Colors.white),):SizedBox(),
                  selection==0?Text("6", style: TextStyle(color: Colors.white),):SizedBox()
                ],
              ),
              Icon(Icons.notifications, color: Color(0xff9B8BFF),)
            ],
          ),
        ),
      ),
    );
  }
}
