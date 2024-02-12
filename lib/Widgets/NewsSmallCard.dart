import 'package:flutter/material.dart';

class NewsSmallCard extends StatelessWidget {
  const NewsSmallCard({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Container(
      height: mediaQuery.size.height*0.12,
      width: mediaQuery.size.width*0.9,
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10
      ),
      decoration: const BoxDecoration(
          color: Color(0xff0D0D0D),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10)
          ),
      ),
      child: Row(
        children: [
          Container(
            height: mediaQuery.size.height*0.12,
            width: mediaQuery.size.width*0.3,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              image: DecorationImage(
                  image: AssetImage("assets/images/hotS1.png"),
                fit: BoxFit.cover
              ),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10)
              ),
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
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
                  Text("Goal.com",
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.white
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
}
