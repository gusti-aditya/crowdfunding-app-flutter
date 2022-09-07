import 'package:cashflowplus/model/bisnis.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/bisnis_provider.dart';
import 'bisnis_detail_widget.dart';
import '../widget/loading_widget.dart';

enum TransactionType { sent, received, pending }

class TransactionGrid extends StatelessWidget {
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
      create: (ctx) => BisnisProvider()..fetchAndSetBisnis(),
      child: Consumer<BisnisProvider>(builder: (ctx, bisnis, _) {
        if (bisnis.bisnisList != null) {
          return ListView.builder(
            itemCount: bisnis.bisnisList!.length,
            itemBuilder: (ctx, index) {
              Bisnis bs = bisnis.bisnisList![index];
              return Transaction(
                  transactionAmout: bs.business_value,
                  transactionInfo: bs.business_name,
                  transactionCategory: bs.business_category,
                  transactionDeadline: bs.due_date,
                  transactionDate: bs.yield_period,
                  img: bs.img_file,
                  yieldPercentage: bs.yield_percentage,
                  bs: bs);
            },
          );
        } else {
          return loading();
        }
      }),
    );
  }
}

class Transaction extends StatelessWidget {
  final TransactionType? transactionType;
  final String? transactionAmout,
      transactionInfo,
      transactionCategory,
      transactionValue,
      transactionDeadline,
      transactionDate,
      receptient,
      yieldPercentage,
      img;
  final Bisnis bs;
  const Transaction(
      {Key? key,
      this.transactionType,
      this.transactionAmout,
      this.transactionInfo,
      this.transactionDeadline,
      this.transactionValue,
      this.transactionCategory,
      this.transactionDate,
      this.receptient,
      this.yieldPercentage,
      this.img,
      required this.bs})
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
      onTap: () {
        Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => BisnisDetail(
                  bisnisDetail: bs,
                )));
      },
      child: Card(
        elevation: 4.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Image.network(
                "https://gelatohouse.id/assets/img/backgrounds/$img",
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "$transactionInfo",
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    width: 300,
                    height: 10,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: LinearProgressIndicator(
                        value: 0.7,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Color(0xff00ff00)),
                        backgroundColor: Color(0xffD6D6D6),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Nilai Bisnis : $yieldPercentage",
                    style: TextStyle(
                        fontSize: 16.0, color: Color.fromARGB(207, 60, 60, 60)),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "$transactionAmout",
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
