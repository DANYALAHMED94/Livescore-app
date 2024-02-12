import 'package:flutter/material.dart';

import '../../../../Widgets/NewsLargeCard.dart';
import '../../../../Widgets/NewsSmallCard.dart';

class HotPage extends StatelessWidget {
  const HotPage({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        height: mediaQuery.size.height*1.6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            // Large Card News
            NewsLargeCard(),

            // Small Card News
            NewsSmallCard(),

            // Large Card News
            NewsLargeCard(),

            // List of Small Cards

            Expanded(
                child: ListView.builder(itemBuilder: (context, index) {
                  return const NewsSmallCard();
                },
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 6,
                )
            )

          ],
        ),
      ),
    );
  }
}
