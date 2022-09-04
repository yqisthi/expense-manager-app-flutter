import 'transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

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
  // String titleInput;
  // String amountInput;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

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
            elevation: 5,
          ),
        ),
        Card(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: "Title"),
                  controller: titleController,
                  // onChanged: (val) {
                  //   titleInput = val;
                  // },
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Amount"),
                  controller: amountController,
                  // onChanged: (val) {
                  //   amountInput = val;
                  // },
                ),
                FlatButton(
                  child: Text("Add Transaction"),
                  textColor: Colors.purple,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
        Column(
          children: transactions.map((tx) {
            return Card(
              child: Row(
                children: <Widget>[
                  // Amount
                  Container(
                    child: Text(
                      '\$${tx.amount}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.purple,
                      ),
                    ),
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.purple,
                        width: 2,
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                  ),

                  Column(
                    // Title and DateTime
                    children: <Widget>[
                      Container(
                        child: Text(
                          tx.title.toString(),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          DateFormat('dd-MM-yyyy').format(tx.date),
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  )
                ],
              ),
            );
          }).toList(),
        )
      ]),
    );
  }
}
