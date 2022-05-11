import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MyApp(),
          title: "그..누구?",
      )
  );
}

class MyApp extends StatefulWidget {//위젯으로 짜집 기 하는형식으로 이루어져있음
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var name = ['가','나','다'];
  List<int> count = [0,0,0];

  void addPerson(i){
    setState(() {
      name.add(i);
      count.add(0);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffB9CEEB),

      endDrawer:Drawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: AppbarUI(),
      ),
      body:
         Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            margin: EdgeInsets.fromLTRB(15, 20, 15, 20),
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: ListView.separated(
              itemCount: name.length,
              itemBuilder: (c,i){
                return ListTile(
                  leading: Text(name[i]),
                  title: Text("${count[i]}"),
                  trailing: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        count[i]++;
                      });
                    },
                    child: Text("좋아요"),
                  )
                );
              },
              separatorBuilder: ( c,  i) => const Divider(
                color: Color(0xff87A8D0),
                thickness: 1,
              ),
            ),
          ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //     showDialog(
      //       context: context,
      //       builder: (context){
      //         return DialogUI(addPerson : addPerson);
      //       },
      //     );
      //   },
      //   child: Text("추가"),
      // ),
      bottomNavigationBar: bottom_bar(),
      );
  }
}

class AppbarUI extends StatelessWidget {
  const AppbarUI({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      actions: [
        Builder(
            builder: (context) {
              return IconButton(onPressed: () => Scaffold.of(context).openEndDrawer(), icon: Icon(
                  Icons.notifications),);
            }
        )
      ],
      backgroundColor: Color(0xffB9CEEB),
      flexibleSpace: Align(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Image.asset(
                  "img/logo.png",
                  width: 100,
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15,20, 15, 0),
                child: TextFormField(
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Search....',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
                    filled: true,
                    fillColor: Color(0xFFFFFEEC),
                    contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  ),
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class DialogUI extends StatelessWidget {
  DialogUI({Key? key, this.addPerson}) : super(key: key);
  var addPerson;
  var inputData = TextEditingController( );
  @override
  Widget build(BuildContext context) {
    // if(inputData.text==''){
    //   print("없음!");
    // }]
    return AlertDialog(
      title: Text("Contact"),
      content: TextField(
        controller: inputData,// 걍 onchane로 input 값 받을 수도 있음.
        decoration: InputDecoration(hintText:"이름을 입력하시오"),
      ),
      actions: [
        TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text("Cancel")),
        TextButton(
            onPressed: (){
              if(inputData.text != ""){
                Navigator.of(context).pop();
                addPerson(inputData.text);
              }
             },
            child: Text("Ok"))
      ],

    );
  }
}


class bottom_bar extends StatelessWidget {
  const bottom_bar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
            children: [
              IconButton(
                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Text('qr코드')));},
                  icon: Icon(Icons.qr_code)),
              IconButton(
                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Text('추가화면')));},
                  icon: Icon(Icons.add)),
              IconButton(
                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Text('날짜')));},
                  icon: Icon(Icons.date_range)),
          ],
        )
      )
    );
  }
}


