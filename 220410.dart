import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
          home: MyApp()
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
  var count = [0,0,0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
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
                    showDialog(context: context, builder: (context){
                      return Dialog(child: Text('안녕'));
                    });
                  },
                  child: Text("좋아요"),
                )
              );
            }
        ),
        bottomNavigationBar: bottom_bar(),
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
            children: const [Icon(Icons.phone),Icon(Icons.message),Icon(Icons.contact_page)],
          ),
        )
    );
  }
}


