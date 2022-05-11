import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
import 'package:nugu/mainpage.dart';
import 'firebase_options.dart';
import 'package:google_sign_in/google_sign_in.dart';




class login extends StatefulWidget {//위젯으로 짜집 기 하는형식으로 이루어져있음
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _login();
}

class _login extends State<login> {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  @override
  Widget build(BuildContext context) {
    GoogleSignInAccount? user = _googleSignIn.currentUser;
    return  Scaffold(
        backgroundColor: Color(0xffB9CEEB),
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset('img/logo.png',height: 200,width: 200,),
              Container(
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("dd"+user.toString()),
                    ElevatedButton(

                        onPressed: user !=null?(){Navigator.push(context, MaterialPageRoute(builder: (context)=>mainpage(userEmail: user.email.toString())));}: ()async{ print(user);await _googleSignIn.signIn();},
                        child: Text("구글로그인")),
                    ElevatedButton(
                        onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>mainpage()));},
                        child: Text("메인페이지")
                    ),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}

