import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var n1=0,n2=0,n3=0;
  final TextEditingController t1 = new TextEditingController(text: "0");
  final TextEditingController t2 = new TextEditingController(text: "0");

  void doAddition(){
    setState(() {
      n1=int.parse(t1.text);
      n2=int.parse(t2.text);
      n3=n1+n2;
    });
  }
  void doSub(){
    setState(() {
      n1=int.parse(t1.text);
      n2=int.parse(t2.text);
      n3=n1-n2;
    });
  }
  void doMul(){
    setState(() {
      n1=int.parse(t1.text);
      n2=int.parse(t2.text);
      n3=n1*n2;
    });
  }
  void doDiv(){
    setState(() {
      n1=int.parse(t1.text);
      n2=int.parse(t2.text);
      n3=(n1/n2).toInt();
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Calculator"),
      ),
      body: new Container(
        padding: const EdgeInsets.all(20.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              "Output: $n3",
              style: new TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            new TextField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                hintText: "Enter Number 1"
              ),
              controller: t1,
            ),
            new TextField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                  hintText: "Enter Number 2"
              ),
              controller: t2,
            ),
            new Padding(padding: const EdgeInsets.only(top: 20.0)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new MaterialButton(
                  onPressed: doAddition,
                  child: new Text("+"),
                  color: Colors.redAccent,
                ),
                new MaterialButton(
                  onPressed: doSub,
                  child: new Text("-"),
                  color: Colors.redAccent,
                ),
              ],
            ),
            new Padding(padding: const EdgeInsets.only(top: 20.0)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new MaterialButton(
                  onPressed: doMul,
                  child: new Text("*"),
                  color: Colors.redAccent,
                ),
                new MaterialButton(
                  onPressed: doDiv,
                  child: new Text("/"),
                  color: Colors.redAccent,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
