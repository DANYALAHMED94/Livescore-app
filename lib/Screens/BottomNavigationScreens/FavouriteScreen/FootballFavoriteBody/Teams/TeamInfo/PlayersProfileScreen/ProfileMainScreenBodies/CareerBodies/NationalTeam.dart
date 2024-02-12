import 'package:flutter/material.dart';

class NationalTeam extends StatelessWidget {
  const NationalTeam({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return SingleChildScrollView(
      child: SizedBox(
          height: mediaQuery.size.height,
          width: mediaQuery.size.width,
          child: ListView.separated(itemBuilder: (context, index) {
            if(index==0){
              return Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 8
                ),
                child: ListTile(
                  tileColor: const Color(0xff161616),
                  trailing: SizedBox(
                    width: mediaQuery.size.width*0.32,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("MP", style: TextStyle(fontSize: 12, color: Colors.white),),
                        Text("G", style: TextStyle(fontSize: 12, color: Colors.white),),
                        Text("A", style: TextStyle(fontSize: 12, color: Colors.white),),
                        Text("Y", style: TextStyle(fontSize: 12, color: Colors.white),),
                        Text("RC", style: TextStyle(fontSize: 12, color: Colors.white),),
                      ],
                    ),
                  ),
                ),
              );
            }
            else{
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10
                    ),
                    child: Text("23/24", style: TextStyle(fontSize: 12, color: Colors.white),),
                  ),
                  SizedBox(
                    width: mediaQuery.size.width*0.83,
                    child: ListTile(
                      leading: Container(
                        height: 20,
                        width: 30,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/spain.png"))
                        ),
                      ),
                      title: const Text("Poland",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: TextStyle(fontSize: 12, color: Colors.white),),
                      trailing: SizedBox(
                        width: mediaQuery.size.width*0.3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("5", style: TextStyle(fontSize: 12, color: Colors.white),),
                            Text("57", style: TextStyle(fontSize: 12, color: Colors.white),),
                            Text("-", style: TextStyle(fontSize: 12, color: Colors.white),),
                            Text("0", style: TextStyle(fontSize: 12, color: Colors.white),),
                            Text("0", style: TextStyle(fontSize: 12, color: Colors.white),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
            separatorBuilder: (context, index) {
              if(index==0){
                return const SizedBox();
              }
              else{
                return const Divider();
              }
            },
            itemCount: 10,
            physics: const NeverScrollableScrollPhysics(),
          )
      ),
    );
  }
}
