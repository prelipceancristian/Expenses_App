import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;
  final Function _deleteTransaction;

  TransactionList(this._userTransactions, this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        child: _userTransactions.isEmpty
            ? Column(children: <Widget>[
                Text('No transactions added yet!',
                    style: Theme.of(context).textTheme.headline6),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ))
              ])
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    elevation: 5,
                    child: ListTile(
                      leading: CircleAvatar(
                          radius: 30,
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: FittedBox(
                                child: Text(
                                    '\$${_userTransactions[index].amount}')),
                          )),
                      title: Text(
                        _userTransactions[index].title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      subtitle: Text(DateFormat('yMMMd')
                          .format(_userTransactions[index].date)),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                        onPressed: () {
                          _deleteTransaction(_userTransactions[index].id);
                        },
                      ),
                    ),
                  );
                },
                itemCount: _userTransactions.length,
              ));
  }
}