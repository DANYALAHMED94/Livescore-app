import 'package:flutter/material.dart';

class S2CardsTennis extends StatelessWidget {
  int index;
  S2CardsTennis({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 3
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xff0D0D0D),
      ),
      child: ListTile(
        leading: SizedBox(
          height: 50,
          width: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("56", textAlign: TextAlign.center, style: TextStyle(color: index==0?Color(0xff9B8BFF):Colors.white),),
              const SizedBox(width: 10,),
              Container(
                height: 50,
                width: 1,
                color: Colors.grey.shade600,
              )

            ],
          ),
        ),

        title: Text("FC Barcelona", style: TextStyle(color: Colors.white),),
        subtitle: Text("Real Madrid", style: TextStyle(color: Colors.white),),
        trailing: SizedBox(
          height: 50,
          width: 80,
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
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("4", style: TextStyle(color: Colors.white),),
                  Text("6", style: TextStyle(color: Colors.white),),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("4", style: TextStyle(color: Colors.white),),
                  Text("6", style: TextStyle(color: Colors.white),),
                ],
              ),
              Icon(Icons.notifications_outlined, color: Color(0xff9B8BFF),)
            ],
          ),
        ),
      ),
    );
  }
}