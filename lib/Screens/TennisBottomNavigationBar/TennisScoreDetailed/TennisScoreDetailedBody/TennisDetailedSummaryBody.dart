import 'package:flutter/material.dart';

class TennisDetailedSummary extends StatelessWidget {
  const TennisDetailedSummary({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Column(
      children: [
        Container(
          height: mediaQuery.size.height*0.225,
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 30,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 0.3,
                color: Colors.grey,
                style: BorderStyle.solid,
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                dense: true,
                leading: const Text("#", style: TextStyle(fontSize: 15, color: Colors.white)),
                trailing: SizedBox(
                  width: mediaQuery.size.width*0.4,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("S", style: TextStyle(fontSize: 15, color: Colors.white)),
                      Text("1", style: TextStyle(fontSize: 15, color: Colors.white)),
                      Text("2", style: TextStyle(fontSize: 15, color: Colors.white)),
                      Text("3", style: TextStyle(fontSize: 15, color: Colors.white)),
                      Text("4", style: TextStyle(fontSize: 15, color: Colors.white)),
                      Text("5", style: TextStyle(fontSize: 15, color: Colors.white)),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          color: Colors.white,
                          style: BorderStyle.solid,
                          width: 0.1
                      ),
                    ),
                    child: ListTile(
                      minLeadingWidth: 1,
                      dense: true,
                      leading: Text("${index+1}", style: TextStyle(fontSize: 15, color: Colors.white)),
                      title: const Text("Kaissir.M (USA)", style: TextStyle(fontSize: 12, color: Colors.white)),
                      trailing: SizedBox(
                        width: mediaQuery.size.width*0.3,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("30", style: TextStyle(fontSize: 15, color: Colors.white)),
                            Text("30", style: TextStyle(fontSize: 15, color: Colors.white)),
                            Text("30", style: TextStyle(fontSize: 15, color: Colors.white)),
                            Text("30", style: TextStyle(fontSize: 15, color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                  itemCount: 2,
                  physics: NeverScrollableScrollPhysics(),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
