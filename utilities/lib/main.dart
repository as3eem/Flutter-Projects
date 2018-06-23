import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: new HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController=new TabController(
        length: 2,
        vsync: this
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new TabBarView(
          children: <Widget>[
            new NewPage("First"),
            new NewPage("Second"),
          ],
        controller: tabController,
      ),
      bottomNavigationBar: new Material(
        color: Colors.teal,
        child: new TabBar(
          controller: tabController,
          tabs: <Widget>[
            new Tab(
              icon: new Icon(Icons.add),
            ),
            new Tab(
              icon: new Icon(Icons.ac_unit),
            )
          ],
        ),
      )

      ,);

  }
}

class NewPage extends StatelessWidget {
  final String title;
  NewPage(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Text(title),
    );
  }
}
