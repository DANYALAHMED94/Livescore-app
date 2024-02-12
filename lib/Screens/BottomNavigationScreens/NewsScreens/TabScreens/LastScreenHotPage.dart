import 'package:flutter/material.dart';

class LastPageHotPage extends StatelessWidget {
  const LastPageHotPage({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: const Color(0xff161616),
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.share, color: Colors.white,))
        ],
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white,),
        ),
      ),
      body: SizedBox(
        height: mediaQuery.size.height,
        width: mediaQuery.size.width,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: mediaQuery.size.height*0.5,
              width: mediaQuery.size.width,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade600,
                    blurRadius: 10,
                    blurStyle: BlurStyle.outer
                  )
                ],
                image: DecorationImage(
                    image: AssetImage("assets/images/hotSubImage.png"),
                  opacity: 0.8
                )
              ),
            ),

            Positioned(
              left: 0,
              right: 0,
              top: mediaQuery.size.height*0.55,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "FC BARCELONA superstar Neymar Jr is back from ACL injury\n"
                      "FC BARCELONA superstar Neymar Jr is back from ACL injury\n"
                      "FC BARCELONA superstar Neymar Jr is back  from ACL injury\n"
                      "FC BARCELONA superstar Neymar Jr is back from ACL injury\n"
                      "FC BARCELONA superstar Neymar Jr is back from ACL injury\n"
                      "FC BARCELONA superstar Neymar Jr is back from ACL injury\n"
                      "FC BARCELONA superstar Neymar Jr is back from ACL injury",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,),),
              ),
            ),

            Positioned(
              left: 0,
              right: 0,
              top: mediaQuery.size.height*0.366,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "FC BARCELONA superstar Neymar Jr is back from ACL injury",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  softWrap: true,
                  style: TextStyle(
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        blurRadius: 5,
                        offset: Offset(
                          2,2
                        )
                      )
                    ],
                    fontSize: 26,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,),),
              ),
            ),
            
            Positioned(
              bottom: mediaQuery.size.height*0.05,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15
                ),
                child: OutlinedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Colors.transparent
                    ),
                    shape: MaterialStatePropertyAll(
                      ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide(
                          color: Colors.white,
                          width: 1,
                          style: BorderStyle.solid
                        )
                      )
                    )
                  ),
                    onPressed: (){},
                    child: const Text("Read More", style: TextStyle(color: Colors.white, fontSize: 12),)),
              ),
            )
          ],
        ),
      ),

    );
  }
}
