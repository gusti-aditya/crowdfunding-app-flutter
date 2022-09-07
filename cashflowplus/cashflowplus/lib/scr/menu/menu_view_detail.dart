import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

final Uri _urlWa = Uri.parse('whatsapp://send?phone=628211991922');
final Uri _urlPDF = Uri.parse(
    'https://dev.gelatohouse.id/assets/docs/2022_KEMITRAAN_GELATO_HOUSE.pdf');
final Uri _urlMidtrans = Uri.parse('http://payments.midtrans.com/');

final List<String> imgList = [
  'https://www.tanamduit.com/wp-content/uploads/2021/09/promo-bonus-dengan-investasi-blog-banner.png',
  'https://superyou.co.id/blog/wp-content/uploads/2020/09/product-banner_Super-Strong-600x200-1.jpg',
  'https://cache.makmur.id/images/blogs/628b2fd13125430a6274c0fa/b1wRBob4PLnuUcXtgGF2bhTQ.png'
];

Future<void> _launchUrl(_url) async {
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}

/// Displays a list of SampleItems.
class MenuViewDetail extends StatelessWidget {
  const MenuViewDetail({
    Key? key,
  }) : super(key: key);

  static const routeName = '/menu_view_detail';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Detail Usaha"),
          centerTitle: true,
          actions: <Widget>[],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Transaction(
                img:
                    "https://gelatohouse.id/assets/img/backgrounds/banner2.jpg",
                receptient: "Gelato House id",
                transactionAmout: "Rp. 650.000.000,-",
                transactionDate: "26 Jun 2021",
                transactionInfo: "Gelato House Cabang Kelapa gading",
                transactionDeadline: "30 Hari lagi",
                transactionCategory: "Saham",
                transactionValue: "Rp. 650.000.000,-",
                transactionType: TransactionType.sent,
              ),
              SizedBox(
                  height: 150,
                  child: DefaultTabController(
                    length: 2,
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: TabBar(
                            tabs: <Widget>[
                              Tab(
                                icon: Padding(
                                    padding: EdgeInsets.all(6.0),
                                    child: Text(
                                      'Deskripsi',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                              ),
                              Tab(
                                icon: Padding(
                                    padding: EdgeInsets.all(6.0),
                                    child: Text(
                                      'Alamat',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            children: <Widget>[
                              Container(
                                  child: Text(
                                      'Bagi Anda yang ingin bergabung menjadi Mitra Gelato House di Indonesia, berikut ini kami sampaikan informasi detail mengenai syarat dan fasilitas yang akan didapatkan, mohon dapat membacanya dengan seksama')),
                              Container(
                                  child: Text(
                                      'Jl. Durian Raya perumnas No.6, RT.07/RW.05, Baranangsiang, bantar kemang, Kota Bogor, Jawa Barat 16142')),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // use whichever suits your need
                children: [
                  Text(
                    "Periode imbal hasil",
                    style: TextStyle(fontSize: 14.0, color: Colors.grey),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // use whichever suits your need
                children: [
                  Text(
                    "3 Bulan",
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // use whichever suits your need
                children: [
                  Text(
                    "Persentase Imbal Hasil",
                    style: TextStyle(fontSize: 14.0, color: Colors.grey),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // use whichever suits your need
                children: [
                  Text(
                    "7.3%",
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // use whichever suits your need
                children: [
                  Text(
                    "Waktu Jatuh Tempo",
                    style: TextStyle(fontSize: 14.0, color: Colors.grey),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // use whichever suits your need
                children: [
                  Text(
                    "31 Agustus 2022",
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // use whichever suits your need
                children: [
                  Text(
                    "Harga Per Lot",
                    style: TextStyle(fontSize: 12.0, color: Colors.black),
                  ),
                  Text(
                    "Rp. 500.000,-",
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              TextFormField(
                  controller: null,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                      labelText: "Lot",
                      hintText: "Jumlah lot",
                      icon: Icon(Icons.money))),
              SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: () {
                  _launchUrl(_urlMidtrans);
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                    primary: Colors.green),
                child: const Text(
                  'Beli Lot',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

enum TransactionType { sent, received, pending }

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
        //Navigator.of(context).push(new MaterialPageRoute(
        //   builder: (BuildContext context) => new Profile()));
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // use whichever suits your need

                    children: [
                      Flexible(
                        child: Text(
                          "$transactionInfo",
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Chip(
                        padding: EdgeInsets.all(0),
                        backgroundColor: Colors.orange,
                        label: Text('Outlet',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // use whichever suits your need
                    children: [
                      Text(
                        "$transactionAmout",
                        style: TextStyle(fontSize: 16.0, color: Colors.black),
                      ),
                      Text(
                        "Unit tersedia",
                        style: TextStyle(fontSize: 12.0, color: Colors.grey),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // use whichever suits your need
                    children: [
                      Text(
                        "Dari target Rp. 1.000.000.000,-",
                        style: TextStyle(fontSize: 12.0, color: Colors.grey),
                      ),
                      Text(
                        "1400",
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    width: 370,
                    height: 10,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: LinearProgressIndicator(
                        value: 0.8,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Color(0xff00ff00)),
                        backgroundColor: Color(0xffD6D6D6),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // use whichever suits your need
                    children: [
                      Text(
                        "43 Investor",
                        style: TextStyle(fontSize: 12.0, color: Colors.black),
                      ),
                      Text(
                        "28 Hari lagi",
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              _launchUrl(_urlWa);
                            },
                            style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.fromLTRB(40, 15, 40, 15),
                                primary: Colors.green),
                            child: const Text(
                              'Hubungi pemilik usaha',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          ElevatedButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute<dynamic>(
                                builder: (_) => PDFViewerFromUrl(
                                  url: _urlPDF.toString(),
                                ),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.fromLTRB(40, 15, 40, 15),
                                primary: Colors.white),
                            child: const Text(
                              'Lihat Prospektus',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            ),
                          ),
                        ],
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

class PDFViewerFromUrl extends StatelessWidget {
  const PDFViewerFromUrl({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prospektus'),
        backgroundColor: Colors.green,
      ),
      body: const PDF().fromUrl(
        url,
        placeholder: (double progress) => Center(child: Text('$progress %')),
        errorWidget: (dynamic error) => Center(child: Text(error.toString())),
      ),
    );
  }
}
