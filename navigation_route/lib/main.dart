import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:navigation_route/page%201.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.lime,
        primaryColor: defaultTargetPlatform == TargetPlatform.iOS
          ? Colors.grey
            :null
      ),
      home: new HomePage(),
      routes: <String, WidgetBuilder>{
        "/a": (BuildContext context)=> new Page1("Page1")
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Navigation with Routing"),
        elevation: defaultTargetPlatform == TargetPlatform.android?5.0:0.0,
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("Aseem Srivastava"),
                accountEmail: new Text("as3eem@gmail.com"),
                currentAccountPicture: new CircleAvatar(
                  backgroundColor: Colors.brown,
                  child: new Text("A"),
                ),
              otherAccountsPictures: <Widget>[
                new CircleAvatar(
                  backgroundColor: Colors.purple,
                  child: new Text("S"),
                )
              ],

            ),
            new ListTile(
              title: new Text("page 1"),
              trailing: new Icon(Icons.hourglass_full),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/a");

              }
            ),

            new ListTile(
              title: new Text("page 2"),
              trailing: new Icon(Icons.airport_shuttle),
            ),
            new Divider(),
            new ListTile(
              title: new Text("Close"),
              trailing: new Icon(Icons.close),
              onTap: ()=> Navigator.of(context).pop(),
            )
          ],
        ),
      ),
      body: new Container(
        child: new Center(
          child: new Text("HOmeapgewa"),
        ),
      ),
    );
  }
}
