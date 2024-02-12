import 'package:flutter/material.dart';

class ListContainersDashboard extends StatelessWidget {
  int index;
  ListContainersDashboard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 3,
        left: 10,
        right: 10
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("8:00 AM", style: TextStyle(color: index==0?Color(0xff9B8BFF):Colors.white),),
                  Text(index==0?"HT":"47:00", style: TextStyle(color: index==0?Color(0xff9B8BFF):Colors.white),),
                ],
              ),
              const SizedBox(width: 10,),
              Container(
                height: 50,
                width: 1,
                color: Colors.grey.shade600,
              )
            ],
          ),
        ),
        minLeadingWidth: 30,
        title: Text("FC Barcelona", style: TextStyle(color: Colors.white,),),
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
              index == 0?Icon(Icons.notifications_outlined, color: Color(0xff9B8BFF),):Icon(Icons.notifications, color: Color(0xff9B8BFF),)
            ],
          ),
        ),
      ),
    );
  }
}
