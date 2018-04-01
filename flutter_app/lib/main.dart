import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List> getCurrencies() async {
  String apiUrl = 'https://api.coinmarketcap.com/v1/ticker/?limit=50';
  // Make a HTTP GET request to the CoinMarketCap API.
  // Await basically pauses execution until the get() function returns a Response
  http.Response response = await http.get(apiUrl);
  // Using the JSON class to decode the JSON String
  return JSON.decode(response.body);
}

void main() async{
  List currencies = await getCurrencies();

  print(currencies);

  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new CryptoListWidget(currencies),
  ));
}

class CryptoListWidget extends StatelessWidget {

  Widget _getAppTitleWidget() {
    return new Text(
      'Cryptocurrencies',
      style: new TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 24.0),
    );
  }

  Widget _getListViewWidget() {
    // We want the ListView to have the flexibility to expand to fill the
    // available space in the vertical axis
    return new Flexible(
        child: new ListView.builder(
          // The number of items to show
            itemCount: _currencies.length,
            // Callback that should return ListView children
            // The index parameter = 0...(itemCount-1)
            itemBuilder: (context, index) {
              // Get the currency at this position
              final Map currency = _currencies[index];

              // Get the icon color. Since x mod y, will always be less than y,
              // this will be within bounds
              final MaterialColor color = _colors[index % _colors.length];

              return _getListItemWidget(currency, color);
            }));
  }

  CircleAvatar _getLeadingWidget(String currencyName, MaterialColor color) {
    return new CircleAvatar(
      backgroundColor: color,
      child: new Text(currencyName[0]),
    );
  }

  Text _getTitleWidget(String currencyName) {
    return new Text(
      currencyName,
      style: new TextStyle(fontWeight: FontWeight.bold),
    );
  }

  Text _getSubtitleWidget(String priceUsd, String percentChange1h) {
    return new Text('\$$priceUsd\n1 hour: $percentChange1h%');
  }

  ListTile _getListTile(Map currency, MaterialColor color) {
    return new ListTile(
      leading: _getLeadingWidget(currency['name'], color),
      title: _getTitleWidget(currency['name']),
      subtitle: _getSubtitleWidget(
          currency['price_usd'], currency['percent_change_1h']),
      isThreeLine: true,
    );
  }

  Container _getListItemWidget(Map currency, MaterialColor color) {
    // Returns a container widget that has a card child and a top margin of 5.0
    return new Container(
      margin: const EdgeInsets.only(top: 5.0),
      child: new Card(
        child: _getListTile(currency, color),
      ),
    );
  }



  Widget _buildBody() {
    return new Container(
      // A top margin of 56.0. A left and right margin of 8.0. And a bottom margin of 0.0.
      margin: const EdgeInsets.fromLTRB(8.0, 56.0, 8.0, 0.0),
      child: new Column(
        // A column widget can have several widgets that are placed in a top down fashion
        children: <Widget>[
          _getAppTitleWidget(),
          _getListViewWidget()
        ],
      ),
    );
  }

// This is a list of material colors. Feel free to add more colors, it won't break the code
final List<MaterialColor> _colors = [Colors.blue, Colors.indigo, Colors.red];
// The underscore before a variable name marks it as a private variable
final List _currencies;

// This is a constructor in Dart. We are assigning the value passed to the constructor
// to the _currencies variable
CryptoListWidget(this._currencies);

@override
Widget build(BuildContext context) {
  return new Scaffold(
    body: _buildBody(),
    backgroundColor: Colors.blue,
  );
}

}