import 'package:flutter/material.dart';
import '../models/transaction.dart';

import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;
  final Function _deleteTransaction;

  TransactionList(this._userTransactions, this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    print('build() TransactionList');
    return _userTransactions.isEmpty
        ? LayoutBuilder(
            builder: (context, constraints) {
              return Column(children: <Widget>[
                Text('No transactions added yet!',
                    style: Theme.of(context).textTheme.headline6),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ))
              ]);
            },
          )
        : ListView(
            children: [
              ..._userTransactions
                  .map((tx) => TransactionItem(
                      key: ValueKey(tx.id),
                      transaction: tx,
                      deleteTransaction: _deleteTransaction))
                  .toList()
            ],
          );
  }
}
