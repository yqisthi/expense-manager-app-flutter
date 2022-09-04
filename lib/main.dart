import 'transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: "t1",
      title: "Patrobas 1945",
      amount: 389.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: "Somethinc Serum",
      amount: 170,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Manager App"),
      ),
      body: Column(children: <Widget>[
        Container(
          width: double.infinity,
          child: Card(
            color: Colors.blue,
            child: Text("Chart"),
          ),
        ),
        Column(
          children: transactions.map((tx) {
            return Card(
              child: Row(
                children: <Widget>[
                  Container(
                    child: Text(tx.amount.toString()),
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                  ),
                  Column(children: <Widget>[
                    Container(child: Text(tx.title.toString())),
                    Container(child: Text(tx.date.toString())),
                  ])
                ],
              ),
            );
          }).toList(),
        )
      ]),
    );
  }
}
