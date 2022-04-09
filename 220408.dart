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
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text("앱임",style: TextStyle(color: Colors.white),),
        ),
        body: Center(
          child: Container(
            width: 300, height: 300,
            decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                border: Border.all(color: Colors.deepPurple),
              borderRadius: BorderRadius.circular(10),
            ),
            //alignment: Alignment.center,//하위 컴포넌트를 중앙에 배치 만약 이게 최상위라면 Align으로 감싸주면됨.
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
              children: [
                Text("너 가는 길이 너무 지치고 힘들 때 말을 해줘 숨기지마 넌 혼자가 아니야 우리도 언젠가 흰수염고래처럼 헤엄쳐 두려움 없이 이 넓은 세상 살아 갈 수 있길"
                  ,style: TextStyle(color: Colors.amberAccent)),
                IconButton(
                    onPressed:(){},
                    icon: Icon(Icons.add),
                    color: Colors.deepOrangeAccent,
                )
              ],
            ),

          ),
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

