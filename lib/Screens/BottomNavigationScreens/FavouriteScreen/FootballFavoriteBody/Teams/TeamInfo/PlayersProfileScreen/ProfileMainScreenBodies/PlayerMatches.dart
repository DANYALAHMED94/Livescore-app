import 'package:flutter/material.dart';

class PlayerMatches extends StatelessWidget {
  const PlayerMatches({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return SingleChildScrollView(
      child: SizedBox(
        height: mediaQuery.size.height*0.52,
          child: ListView.builder(itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(
                vertical: 5
              ),
              decoration: BoxDecoration(
                color: const Color(0xff161616),
                borderRadius: BorderRadius.circular(8)
              ),
              child: Center(
                child: ListTile(
                    dense: true,
                    tileColor: Colors.transparent,
                    leading: SizedBox(
                      height: 50,
                      width: mediaQuery.size.width*0.18,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("8:00 AM", style: TextStyle(color: const Color(0xff9B8BFF)),),
                              Text("HT", style: TextStyle(color: const Color(0xff9B8BFF)),),
                            ],
                          ),
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
                      width: mediaQuery.size.width*0.2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("XI", style: TextStyle(color: Colors.grey, fontSize: 12),),

                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("4", style: TextStyle(color: Colors.white, fontSize: 12),),
                              Text("0", style: TextStyle(color: Colors.white, fontSize: 12),),
                            ],
                          ),

                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.green,
                            ),
                            child: Center(child: Text("W", style: TextStyle(color: Colors.white, fontSize: 12),)),
                          )

                        ],
                      ),
                    )
                ),
              ),
            );
          },
            itemCount: 5,
            itemExtent: 80,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: 20
            ),
          )
      ),
    );
  }
}
