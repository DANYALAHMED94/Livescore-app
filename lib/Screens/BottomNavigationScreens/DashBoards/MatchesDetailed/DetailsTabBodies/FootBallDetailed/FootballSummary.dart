import 'package:flutter/material.dart';
import '../../../../../ModelClasses/SummaryModel.dart';

class F_Summary extends StatelessWidget {
  F_Summary({super.key});

  List<SummaryModel> scoreList = [
    SummaryModel("1", "Yasir", "40"),
    SummaryModel("1", "Ali", "40"),
    SummaryModel("2", "Raza", "50"),
    SummaryModel("2", "Jafar", "60"),
    SummaryModel("1", "Bhola", "40"),
  ];

  List<SummaryModel> scoreList2 = [
    SummaryModel("2", "Yasir", "40"),
    SummaryModel("2", "Ali", "40"),
    SummaryModel("2", "Raza", "50"),
    SummaryModel("2", "Jafar", "60"),
    SummaryModel("2", "Bhola", "40"),
  ];

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return SingleChildScrollView(
      child: SizedBox(
          height: mediaQuery.size.height*1.26,
          width: mediaQuery.size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10
                ),
                height: mediaQuery.size.height*0.35,
                child: ListView.builder(itemBuilder: (context, index) {
                  return Container(
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8)
                      ),
                      width: mediaQuery.size.width,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 8
                      ),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                              width: mediaQuery.size.width*0.25,
                              child: scoreList[index].team=="1"
                                  ?Text(scoreList[index].name, textAlign: TextAlign.center,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.white),)
                                  :SizedBox()
                          ),
                          SizedBox(
                            width: mediaQuery.size.width*0.25,
                            child: Text(scoreList[index].score, textAlign: TextAlign.center,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.white),),
                          ),
                          SizedBox(
                              width: mediaQuery.size.width*0.25,
                              child: scoreList[index].team=="2"
                                  ?Text(scoreList[index].name, textAlign: TextAlign.center,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.white),)
                                  :SizedBox()
                          )
                        ],
                      )
                  );
                },
                  itemCount: scoreList.length,
                  physics: NeverScrollableScrollPhysics(),
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 25
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: mediaQuery.size.width*0.33,
                      child: const Divider(
                        color: Colors.white,
                        thickness: 0.5,
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.symmetric(
                          horizontal: 10
                      ),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(
                        child: Text("HT", style: TextStyle(color: Colors.white),),
                      ),
                    ),
                    SizedBox(
                      width: mediaQuery.size.width*0.33,
                      child: const Divider(
                        color: Colors.white,
                        thickness: 0.5,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10
                ),
                height: mediaQuery.size.height*0.35,
                child: ListView.builder(itemBuilder: (context, index) {
                  return Container(
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8)
                      ),
                      width: mediaQuery.size.width,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 8
                      ),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                              width: mediaQuery.size.width*0.25,
                              child: scoreList2[index].team=="1"
                                  ?Text(scoreList2[index].name, textAlign: TextAlign.center,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.white),)
                                  :SizedBox()
                          ),
                          SizedBox(
                            width: mediaQuery.size.width*0.25,
                            child: Text(scoreList2[index].score, textAlign: TextAlign.center,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.white),),
                          ),
                          SizedBox(
                              width: mediaQuery.size.width*0.25,
                              child: scoreList2[index].team=="2"
                                  ?Text(scoreList2[index].name, textAlign: TextAlign.center,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.white),)
                                  :SizedBox()
                          )
                        ],
                      )
                  );
                },
                  itemCount: scoreList2.length,
                  physics: NeverScrollableScrollPhysics(),
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 25
                ),
                child: Text("Media #Clasico", style: TextStyle(color: Colors.white, fontSize: 18),),
              ),
              Expanded(
                  child: ListView.builder(itemBuilder: (context, index) {
                    return Container(
                      height: mediaQuery.size.height*0.2,
                      width: mediaQuery.size.width,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 10
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                      ),
                    );
                  },
                    itemCount: 2,
                    physics: NeverScrollableScrollPhysics(),
                  ))
            ],
          )
      ),
    );
  }
}
