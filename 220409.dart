import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {//위젯으로 짜집 기 하는형식으로 이루어져있음
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: SizedBox(
            child: Row(
              children: const [Text("금호동 3가  ",style: TextStyle(color: Colors.white)),Icon(Icons.arrow_downward)],
            )
          )

        ),
        body:Container(
          padding: EdgeInsets.all(10),
          height: 150,
          child:Row(
            children: [
              Flexible(child: Image.asset("img/iu.jpg"),flex: 3),
              Flexible(child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("카메라"),
                    Text("위치어디"),
                    Text("7000원"),
                    Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [Icon(Icons.favorite_border,size:20),Text("4")],
                        )


                  ],
                ),
              ), flex: 7)],
          )
        ),
        bottomNavigationBar: BottomAppBar(
          child: SizedBox(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
              children: const [Icon(Icons.phone),Icon(Icons.message),Icon(Icons.contact_page)],
            ),
          )
        ),
      )
    );
  }
}

