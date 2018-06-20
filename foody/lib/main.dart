import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Funtreat",
      home: new HomePage(),
      theme: new ThemeData(
        primarySwatch: Colors.orange,
        brightness: Brightness.light,
        accentColor: Colors.red,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {

  String  data = "blabla";

  void _change(){
    setState(() {
      if(data.startsWith("b")){
        data= "arshit";
      }
      else{
        data= "blabla";
      }
    });
  }

  Widget _bodyWidget(){
    return new Container(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(data,style: new TextStyle(
              fontSize: 22.0,
            ),),

          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Funtreat"),
      ),
      body: _bodyWidget(),
      floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.add),
        onPressed: _change,
      ),
    );
  }
}
