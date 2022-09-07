import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import '../../model/bisnis.dart';

final Uri _urlMidtrans = Uri.parse('http://payments.midtrans.com/');

Future<void> _launchUrl(_url) async {
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}

/// Displays a list of SampleItems.
class BisnisDetail extends StatelessWidget {
  final Bisnis bisnisDetail;
  static const routeName = '/bisnis_view_detail';
  const BisnisDetail({Key? key, required this.bisnisDetail}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final String business_name = bisnisDetail.business_name;
    final String owner_contact = bisnisDetail.owner_contact;
    final String yield_period = bisnisDetail.yield_period;
    final String yield_percentage = bisnisDetail.yield_percentage;
    final String due_date = bisnisDetail.due_date;
    final String description = bisnisDetail.description;
    final String business_category = bisnisDetail.business_category;
    final String publisher = bisnisDetail.publisher;
    final String business_value = bisnisDetail.business_value;
    final String max_unit = bisnisDetail.max_unit;
    final String address = bisnisDetail.address;
    final String img_file = bisnisDetail.img_file;
    final String lot_price = bisnisDetail.lot_price;
    final String total_investor = bisnisDetail.total_investor;
    final String remaining_unit = bisnisDetail.remaining_unit;
    final String progress_percentage = bisnisDetail.progress_percentage;
    final String total_purchased = bisnisDetail.total_purchased;
    final String remaining_days = bisnisDetail.remaining_days;
    final String business_document = bisnisDetail.business_document;
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
              Business(
                img: "https://gelatohouse.id/assets/img/backgrounds/$img_file",
                receptient: "$publisher",
                businessAmout: "Rp. $business_value,-",
                businessDate: "$due_date",
                businessInfo: "$business_name",
                businessDeadline: "$yield_period",
                businessCategory: "$business_category",
                businessValue: "Rp. $business_value",
                businessType: BusinessType.sent,
                urlWa: "$owner_contact",
                urlPDF: "$business_document",
                business_document: "$business_document",
                progress_percentage: "$progress_percentage",
                remaining_days: "$remaining_days",
                remaining_unit: "$remaining_unit",
                total_investor: "$total_investor",
                total_purchased: "$total_purchased",
              ),
              SizedBox(
                  height: 150,
                  child: DefaultTabController(
                    length: 2,
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: TabBar(
                            indicatorColor: Colors.green,
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
                              Container(child: Text('$description')),
                              Container(child: Text('$address')),
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
                    "$yield_period",
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
                    "$yield_percentage %",
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
                    "$due_date",
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
                    "Rp. $lot_price",
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

enum BusinessType { sent, received, pending }

class Business extends StatelessWidget {
  final BusinessType? businessType;
  final String? businessAmout,
      businessInfo,
      businessCategory,
      businessValue,
      businessDeadline,
      businessDate,
      receptient,
      urlWa,
      urlPDF,
      total_investor,
      remaining_unit,
      progress_percentage,
      total_purchased,
      remaining_days,
      business_document,
      img;
  const Business(
      {Key? key,
      this.businessType,
      this.businessAmout,
      this.businessInfo,
      this.businessDeadline,
      this.businessValue,
      this.businessCategory,
      this.businessDate,
      this.receptient,
      this.urlWa,
      this.urlPDF,
      this.total_investor,
      this.remaining_unit,
      this.progress_percentage,
      this.total_purchased,
      this.remaining_days,
      this.business_document,
      this.img})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    String? businessName;
    IconData? businessIconData;
    Color color;
    final Uri _urlWa = Uri.parse('whatsapp://send?phone=$urlWa');
    final Uri _urlPDF =
        Uri.parse('https://dev.gelatohouse.id/assets/docs/$urlPDF');

    switch (businessType) {
      case BusinessType.sent:
        businessName = "Sent";
        businessIconData = Icons.arrow_upward;
        color = Color.fromARGB(255, 255, 255, 255);
        break;
      case BusinessType.received:
        businessName = "Received";
        businessIconData = Icons.arrow_downward;
        color = Colors.green;
        break;
      case BusinessType.pending:
        businessName = "Pending";
        businessIconData = Icons.arrow_upward;
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
                          "$businessInfo",
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Chip(
                        padding: EdgeInsets.all(0),
                        backgroundColor: Colors.orange,
                        label: Text('$businessCategory',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // use whichever suits your need
                    children: [
                      Text(
                        "Rp. $total_purchased",
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
                        "Dari target Rp. $businessAmout",
                        style: TextStyle(fontSize: 12.0, color: Colors.grey),
                      ),
                      Text(
                        "$remaining_unit",
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
                        value: double.parse("$progress_percentage"),
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
                        "$total_investor Total Investor",
                        style: TextStyle(fontSize: 12.0, color: Colors.black),
                      ),
                      Text(
                        "$remaining_days Hari lagi",
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
                              'Diskusi dengan kami',
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
