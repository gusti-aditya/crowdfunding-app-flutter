import 'package:flutter/material.dart';
import '../model/portofolio.dart';
import 'dart:convert';
import '.././config/constant/api_url.dart';

import 'package:http/http.dart' as http;

//import '../model/http_exception.dart';

class PortofolioProvider with ChangeNotifier {
  List<Portofolio>? bisnisList;
  Portofolio? bisnis;
  static String mainUrl = API.MAIN_URL;
  Portofolio? prevPortofolio;

  PortofolioProvider({this.bisnisList, this.bisnis});

  getPortofolioList() => this.bisnisList;
  setPortofolios(List<Portofolio> bisnisList) => this.bisnisList = bisnisList;

  getPortofolio() => this.bisnis;
  setPortofolio(Portofolio bisnis) => this.bisnis = bisnis;

  List<Portofolio> _items = [];

  List<Portofolio> get items {
    return [..._items];
  }

  Portofolio findById(String id) {
    return _items.firstWhere((prod) => prod.customers_business_id == id);
  }

  Future<void> fetchAndSetPortofolio() async {
    var url = Uri.http('$mainUrl', '/bisnis/getBusiness');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      final List<Portofolio> loadedPortofolio = [];
      extractedData.forEach((prodId, prodData) {
        loadedPortofolio.add(Portofolio(
          customers_business_id: prodData['customers_business_id'],
          bisnis_id: prodData['bisnis_id'],
          customer_id: prodData['customer_id'],
          purchased_lot: prodData['purchased_lot'],
          purchase_status: prodData['purchase_status'],
          purchase_date: prodData['purchase_date'],
        ));
      });
      bisnisList = loadedPortofolio;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
