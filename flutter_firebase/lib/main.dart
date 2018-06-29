import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Best Player Vote:',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(
        title: 'Best Footballer',
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return ListTile(
        title: Row(
            children: <Widget>[
                Expanded(
                  child: Text(
                    document['Name'],
                    style: Theme.of(context).textTheme.headline,
                  ),
                ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.black45
                ),
                padding: const EdgeInsets.all(10.0),
                child: Text(
                   document['Votes'].toString(),
                  style: Theme.of(context).textTheme.display1,
        )
    )]),
    onTap: (){

          print("Voted");
          Firestore.instance.runTransaction((transaction) async {
            DocumentSnapshot freshSnap = await transaction.get(document.reference);
            await transaction.update(freshSnap.reference, {
              'Votes': document['Votes']+1
            });
          });
    },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text(title),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('Best Player').snapshots(),
        builder: (context, snapshot) {
          print(snapshot.data);
          if (!snapshot.hasData) return const Text("Loading...");
          return ListView.builder(
              itemExtent: 80.0,
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) =>
                  _buildListItem(context, snapshot.data.documents[index]),
            );
        },
      ),
    );
  }
}
