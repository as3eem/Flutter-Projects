import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red,
        accentColor: Colors.yellowAccent,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: new Map<String,WidgetBuilder>(

      )
    );
  }
}

//
//void main() => runApp(MaterialApp(
//      theme: ThemeData(
//        primaryColor: Colors.red,
//        accentColor: Colors.yellowAccent,
//      ),
//      debugShowCheckedModeBanner: true,
//      home: SplashScreen(),
//  routes: new Map<String, WidgetBuilder>{
//    "/a": (BuildContext context)=>new location(),
//  },
//    ));

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 7),()=>debugPrint("Done"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(fit: StackFit.expand, children: <Widget>[
      Container(
        decoration: BoxDecoration(
          color: Colors.red,
        ),
      ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 65.0,
                        child: Icon(
                          Icons.fastfood,
                          size: 80.0,
                          color: Colors.red,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text("FunTreat",style: TextStyle(
                          color: Colors.white,
                          fontSize: 34.0,
                          fontWeight: FontWeight.bold,
                      )),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(padding: EdgeInsets.only(top: 20.0),),
                    Text("Loading lots of fatty food",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15.0
                    ),)
                  ],
                ),
              )
            ],
          ),
    ]));
  }
}
