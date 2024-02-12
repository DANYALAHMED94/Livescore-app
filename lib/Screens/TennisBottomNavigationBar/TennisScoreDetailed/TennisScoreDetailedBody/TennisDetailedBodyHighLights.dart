import 'package:flutter/material.dart';

class TennisScoreDetailedHighLightBody extends StatelessWidget {
  const TennisScoreDetailedHighLightBody({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return SingleChildScrollView(
      child: Container(
        height: mediaQuery.size.height*1.31,
        width: mediaQuery.size.width,
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 8,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.grey,
            width: 0.3,
            style: BorderStyle.solid
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(itemBuilder: (context, index) {
                return cardListBuilder(index);
              },
                physics: NeverScrollableScrollPhysics(),
              itemCount: 24,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget cardListBuilder(int index){
    return Container(
      height: 35,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 3
      ),
      padding: const EdgeInsets.symmetric(
          horizontal: 8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
            color: Colors.grey,
            width: 0.3,
            style: BorderStyle.solid
        ),
      ),
      child: const Center(
        child: Text(
          "Tennis is a game played with two opposing players (singles) or pairs of players (doubles) using tautly strung rackets to hit a ball of specified size, weight, and bounce over a net on a rectangular court.",
          textAlign: TextAlign.start,
          softWrap: true,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
