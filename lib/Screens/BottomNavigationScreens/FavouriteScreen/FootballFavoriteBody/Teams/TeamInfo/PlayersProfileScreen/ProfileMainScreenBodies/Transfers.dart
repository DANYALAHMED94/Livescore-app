import 'package:flutter/material.dart';

class TransfersPlayerProfile extends StatelessWidget {
  const TransfersPlayerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return SingleChildScrollView(
      child: SizedBox(
        height: mediaQuery.size.height*0.62,
        width: mediaQuery.size.width,
        child: ListView.builder(itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("23/24", style: TextStyle(fontSize: 10, color: Colors.white),),
                    SizedBox(
                      width: mediaQuery.size.width*0.4,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey.shade300,
                          backgroundImage: AssetImage("assets/images/buyern.png"),
                          radius: 15,
                        ),
                        title: const Text("Bayern Munich",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: TextStyle(fontSize: 10, color: Colors.white),),
                      ),
                    ),

                    SizedBox(
                      width: mediaQuery.size.width*0.4,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage("assets/images/FC-Barcelona.png"),
                          radius: 15,
                        ),
                        subtitle: const Text("fee \$30.0m",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: TextStyle(fontSize: 10, color: Colors.white),),
                        title: const Text("FC Barcelona",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: TextStyle(fontSize: 10, color: Colors.white),),
                      ),
                    ),

                  ],
                ),
                Divider(
                  color: Colors.grey.shade600,
                  thickness: 0.5,
                )
              ],
            ),
          );
        },
          itemCount: 5,
          itemExtent: 88,
          physics: NeverScrollableScrollPhysics(),

        ),
      ),
    );
  }
}
