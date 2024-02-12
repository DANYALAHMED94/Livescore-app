import 'package:flutter/material.dart';

import '../../../ModelClasses/StatsLinearProgressModel.dart';

class TennisDetailedStatsBody extends StatelessWidget {
  TennisDetailedStatsBody({super.key});

  List<StatsLinearProgressModel> sets = [
    StatsLinearProgressModel(0.59, "Aces"),
    StatsLinearProgressModel(0.20, "Double Faults"),
    StatsLinearProgressModel(0.40, "1st Serve %"),
    StatsLinearProgressModel(0.60, "Break Point Saved"),
    StatsLinearProgressModel(0.30, "1st Returned Points Won"),
    StatsLinearProgressModel(0.80, "2nd Returned Points Won"),
    StatsLinearProgressModel(0.70, "Break Point Converted"),
    StatsLinearProgressModel(0.40, "Break Point Converted"),
  ];

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
          horizontal: 10
      ),
      child: SizedBox(
        width: mediaQuery.size.width,
        height: mediaQuery.size.height*1.78,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Audio Commentary", style: TextStyle(
                        color: Colors.white,
                      ),),
                      SizedBox(width: 10,),
                      Icon(Icons.multitrack_audio, size: 25,color: Colors.white,),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Text("Set 1", style: TextStyle(
                  color: Colors.white,
                  fontSize: 16
              ),),
            ),
            SizedBox(
                height: mediaQuery.size.height*0.8,
                child: ListView.builder(itemBuilder: (context, index) {
                  return linearProgressContainerBuilder(index);
                },
                  itemCount: sets.length,
                  physics: NeverScrollableScrollPhysics(),
                )),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Set 2", style: TextStyle(
                  color: Colors.white,
                  fontSize: 16
              ),),
            ),
            SizedBox(
                height: mediaQuery.size.height*0.8,
                child: ListView.builder(itemBuilder: (context, index) {
                  return linearProgressContainerBuilder(index);
                },
                  itemCount: sets.length,
                  physics: NeverScrollableScrollPhysics(),
                )),
          ],
        ),
      ),
    );
  }

  Widget linearProgressContainerBuilder(int indexValue){
    return Container(
      height: 60,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 8
      ),
      padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5
      ),
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${(sets[indexValue].completed*100).toInt()}%", style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15
              ),),
              Text(sets[indexValue].name, style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15
              ),),
              Text("${((1-sets[indexValue].completed)*100).toInt()}%", style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15
              ),),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(
                vertical: 5
            ),
            height: 5,
            width: double.infinity,
            child: LinearProgressIndicator(
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation<Color>(const Color(0xff9B8BFF),),
              value: sets[indexValue].completed,
            ),
          ),
        ],
      ),
    );
  }

}
