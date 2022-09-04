import 'package:flutter/material.dart';

import 'new_transaction.dart';
import '../models/transaction.dart';
import 'transaction_list.dart';

class UserTransaction extends StatefulWidget {
  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
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
    return Column(
      children: <Widget>[
        NewTransaction(),
        TransactionList(_userTransactions),
      ],
    );
  }
}
