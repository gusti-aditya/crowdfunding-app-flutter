import 'package:cashflowplus/model/bisnis.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/transaction_provider.dart';
import 'loading_widget.dart';
import '../../model/transaction.dart';

enum TransactionType { sent, received, pending }

class TransactionWidget extends StatelessWidget {
  @override
  void initState() {
    // Provider.of<Products>(context).fetchAndSetProducts(); // WON'T WORK!
    // Future.delayed(Duration.zero).then((_) {
    //   Provider.of<Products>(context).fetchAndSetProducts();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => TransactionProvider(
          authToken:
              'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2NjE5OTk2ODcsIm5iZiI6MTY2MTk5OTY5NywiZXhwIjoxNjYyMDQyODg3LCJleHBpcmVkX2luIjo0MzIwMCwidXNlcmRhdGEiOnsiY3VzdG9tZXJfaWQiOiI2MmYwYzExYzk0OThlIiwiZmlyc3RfbmFtZSI6IkFkaXR5YSIsImxhc3RfbmFtZSI6Ikd1c3RpIiwicGhvbmVfbm8iOiIwIiwiZW1haWwiOiJnbS5hZGl0eWEyMTNAZ21haWwuY29tIiwiYmlydGhfZGF0ZSI6bnVsbCwiYWRkcmVzcyI6bnVsbCwiY291bnRyeSI6bnVsbCwicHJvdmluY2UiOm51bGwsImNpdHkiOm51bGwsInBvc3RhbF9jb2RlIjpudWxsLCJpc192ZXJpZmllZCI6IjAiLCJpc19kZWxldGVkIjoiMCIsInJlZ19kYXRlIjoiMjAyMi0wOC0wOCAxNDo1NDowNCIsInBhc3N3b3JkIjoiJDJ5JDEwJFNHcUZpbU1ENHNOU29HZ1RFc0RXSi52eDkvL0hVSENMUnZsZDRLeW5tVExYVFcxZzZFNWZhIiwiY3JlYXRlZF9hdCI6IjIwMjItMDgtMDggMDI6NTQ6MDQiLCJ1cGRhdGVkX2F0IjoiMjAyMi0wOC0wOCAwMjo1NDowNCIsImRlbGV0ZWRfYXQiOm51bGx9fQ.JOFNOe58rsu-D2C8usMsx9duJl7TFt20MFfQMQqaUr4')
        ..fetchAndSetTransactions(),
      child: Consumer<TransactionProvider>(builder: (ctx, trx, _) {
        if (trx.transactionList != null) {
          return ListView.builder(
            itemCount: trx.transactionList!.length,
            itemBuilder: (ctx, index) {
              Transactions tx = trx.transactionList![index];
              return TransactionHistory(
                  business_id: tx.bisnis_id,
                  business_name: tx.bisnis_name,
                  confirm_file: tx.confirm_file,
                  customer_id: tx.customer_id,
                  lot_amount: tx.lot_amount.toString(),
                  lot_value: tx.lot_value.toString(),
                  purchase_date: tx.purchase_date.toString(),
                  status: tx.status,
                  subtotal: tx.subtotal.toString(),
                  transaction_id: tx.transaction_id,
                  transaction_dest: tx.transaction_dest,
                  transaction_method: tx.transaction_method,
                  trx: tx);
            },
          );
        } else {
          return loading();
        }
      }),
    );
  }
}

class TransactionHistory extends StatelessWidget {
  final TransactionType? transactionType;
  final String? transaction_id,
      customer_id,
      lot_amount,
      lot_value,
      subtotal,
      purchase_date,
      status,
      transaction_method,
      transaction_dest,
      transaction_type,
      business_id,
      confirm_file,
      business_name;
  final Transactions trx;
  const TransactionHistory(
      {Key? key,
      this.transaction_id,
      this.customer_id,
      this.lot_amount,
      this.lot_value,
      this.subtotal,
      this.purchase_date,
      this.status,
      this.transaction_method,
      this.transaction_dest,
      this.transaction_type,
      this.business_id,
      this.confirm_file,
      this.business_name,
      required this.trx,
      this.transactionType})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    String? transactionName;
    IconData? transactionIconData;
    Color color;
    switch (transactionType) {
      case TransactionType.sent:
        transactionName = "Sent";
        transactionIconData = Icons.arrow_upward;
        color = Color.fromARGB(255, 255, 255, 255);
        break;
      case TransactionType.received:
        transactionName = "Received";
        transactionIconData = Icons.arrow_downward;
        color = Colors.green;
        break;
      case TransactionType.pending:
        transactionName = "Pending";
        transactionIconData = Icons.arrow_upward;
        color = Colors.orange;
        break;
    }
    return InkWell(
      onTap: () {},
      child: Card(
        elevation: 4.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "Pembelian Lot untuk $business_name",
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Jumlah pembelian : $lot_amount x $lot_value",
                    style: TextStyle(
                        fontSize: 16.0, color: Color.fromARGB(207, 60, 60, 60)),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Subtotal $subtotal",
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
                  ),
                  Row(
                    children: <Widget>[
                      Column(
                        children: [],
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
