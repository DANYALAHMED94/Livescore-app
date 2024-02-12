import 'package:flutter/material.dart';

class S2CardsTennis extends StatelessWidget {
  const S2CardsTennis({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff0D0D0D),
      margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5
      ),
      child: const ListTile(
        leading: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 10
          ),
          child: Text("56", textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
        ),
        minLeadingWidth: 50,
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
                  Text("4", style: TextStyle(color: Colors.white),),
                  Text("6", style: TextStyle(color: Colors.white),),
                ],
              ),
              Icon(Icons.notifications, color: Colors.white,)
            ],
          ),
        ),
      ),
    );
  }
}
