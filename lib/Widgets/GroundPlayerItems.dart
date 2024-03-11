import 'package:flutter/material.dart';

class GroundPlayerItems extends StatelessWidget {
  String shirt,name;
  int value;
  bool isWhite;
  GroundPlayerItems({super.key, required this.shirt, required this.value, required this.name, required this.isWhite});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return SizedBox(
      height: 70,
      width: 50,
      child: Column(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(shirt),
                fit: BoxFit.cover
              )
            ),
            child: Center(
              child: Text(value.toString(),
                style: TextStyle(
                    fontSize: 12,
                    color: isWhite?Colors.white:Colors.black,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
          ),
          Text(
            name,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 10),)
        ],
      ),
    );
  }
}
