import 'package:flutter/material.dart';
import 'menu_view_detail.dart';
import '../portofolio/portofolio_view.dart';
import '../history/history_view.dart';
import '../widget/bisnis_widget.dart';

enum FilterOptions {
  Favorites,
  All,
}

enum ButtonType { payBills, donate, receiptients, offers }

enum TransactionType { sent, received, pending }

class MenuDemoScreen extends StatefulWidget {
  static const routeName = '/menu_demo_view';

  const MenuDemoScreen({Key? key}) : super(key: key);

  @override
  _MenuDemoScreenState createState() => _MenuDemoScreenState();
}

class _MenuDemoScreenState extends State<MenuDemoScreen> {
  var _showOnlyFavorites = false;

  int _pageIndex = 0;
  PageController _pageController = PageController();

  List<Widget> tabPages = [
    Column(
      children: <Widget>[TransactionGrid()],
    )
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          titleSpacing: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/images/logocashflow.png",
                  width: 120, height: 120)
            ],
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          actions: <Widget>[
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.mail_outline),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
        body: PageView(
          children: [TransactionGrid()],
          //onPageChanged: onPageChanged,
          //controller: _pageController,
        ),
      ),
    );
  }

  void onPageChanged(int page) {
    setState(() {
      this._pageIndex = page;
    });
  }

  void onTabTapped(int index) {
    this._pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
}

class SendReceiveSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white54,
      ),
      padding: EdgeInsets.all(22.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
              width: 51,
              height: 51,
              padding: EdgeInsets.all(15.0),
              margin: const EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.white54, Theme.of(context).primaryColor],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.3, 1]),
                shape: BoxShape.circle,
              ),
              child: Text("Rp.")),
          Row(
            children: [
              Text("1.200.000,-",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final ButtonType buttonType;
  const CustomButton({Key? key, required this.buttonType}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String buttonText = "", buttonImage;
    switch (buttonType) {
      case ButtonType.payBills:
        buttonText = "LAPORAN KEUANGAN";
        buttonImage = "assets/receipt.png";
        break;
      case ButtonType.donate:
        buttonText = "DONASI ANAK";
        buttonImage = "assets/donation.png";
        break;
      case ButtonType.receiptients:
        buttonText = "DAFTAR ASUH";
        buttonImage = "assets/users.png";
        break;
      case ButtonType.offers:
        buttonText = "LAPORAN KELUHAN";
        buttonImage = "assets/phone2.png";
        break;
    }
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          switch (buttonType) {
            case ButtonType.payBills:
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new PortofolioView()));
              break;
            case ButtonType.donate:
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new HistoryView()));
              break;
          }
        },
        child: Container(
          padding: EdgeInsets.all(5.0),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(17),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  gradient: LinearGradient(
                    colors: [Colors.white10, Colors.black12],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Image.asset(
                  buttonImage,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              FittedBox(
                child: Text(buttonText),
              ),
            ],
          ),
        ),
      ),
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
      img;
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
      this.img})
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
            builder: (BuildContext context) => new MenuViewDetail()));
      },
      child: Card(
        elevation: 4.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Image.network(
                "$img",
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
                    "Nilai Bisnis : 80%",
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

class SendScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Send Money"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "Select Payee",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19.0),
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, payees) {
                return ListTile(
                  title: PayeeContainer(),
                  onTap: () {},
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class PayeeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                "https://gelatohouse.id/assets/img/logo/logo.jpg",
              ),
            ),
          ),
          Flexible(
            flex: 6,
            child: Container(
              padding: EdgeInsets.all(13.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "John Doe",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "+213123456789",
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
