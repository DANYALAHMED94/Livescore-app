import 'package:flutter/material.dart';

import '../Screens/BottomNavigationScreens/NewsScreens/TabScreens/LastScreenHotPage.dart';

class NewsLargeCard extends StatelessWidget {
  const NewsLargeCard({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return GestureDetector(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) =>
                const LastPageHotPage(),));
      },
      child: Container(
        height: mediaQuery.size.height*0.25,
        width: mediaQuery.size.width,
        margin: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10
        ),
        decoration: BoxDecoration(
            color: const Color(0xff0D0D0D),
            borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: mediaQuery.size.height*0.15,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/hotL1.png"),
                  fit: BoxFit.fill
                ),
                  color: Colors.grey.shade300,
                  borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(10)
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10
              ),
              child: SizedBox(
                  width: mediaQuery.size.width*0.7,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("It seems like you've mentioned match information,"
                          " but it's not clear what specific information or "
                          "assistance you're seeking regarding matches. "
                          "Could you please provide",
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white
                        ),
                      ),

                      SizedBox(height: 10,),

                      Text("Goals.com",
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.white
                        ),
                      ),
                      SizedBox(height: 10,),
                    ],
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
