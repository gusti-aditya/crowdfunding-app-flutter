import 'package:flutter/material.dart';
import '../model/bisnis.dart';
import 'dart:convert';
import '.././config/constant/api_url.dart';

import 'package:http/http.dart' as http;

//import '../model/http_exception.dart';

class BisnisProvider with ChangeNotifier {
  List<Bisnis>? bisnisList;
  Bisnis? bisnis;
  static String mainUrl = API.MAIN_URL;
  Bisnis? prevBisnis;

  BisnisProvider({this.bisnisList, this.bisnis});

  getBisnisList() => this.bisnisList;
  setBisniss(List<Bisnis> bisnisList) => this.bisnisList = bisnisList;

  getBisnis() => this.bisnis;
  setBisnis(Bisnis bisnis) => this.bisnis = bisnis;

  List<Bisnis> _items = [];

  List<Bisnis> get items {
    return [..._items];
  }

  Bisnis findById(String id) {
    return _items.firstWhere((prod) => prod.business_id == id);
  }

  Future<void> fetchAndSetBisnis() async {
    var url = Uri.http('$mainUrl', '/bisnis/getBusiness');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      final List<Bisnis> loadedBisnis = [];
      extractedData.forEach((prodId, prodData) {
        loadedBisnis.add(Bisnis(
          business_id: prodData['business_id'],
          business_name: prodData['business_name'],
          owner_contact: prodData['owner_contact'],
          yield_period: prodData['yield_period'],
          yield_percentage: prodData['yield_percentage'],
          due_date: prodData['due_date'],
          description: prodData['description'],
          business_category: prodData['business_category'],
          publisher: prodData['publisher'],
          business_value: prodData['business_value'],
          max_unit: prodData['max_unit'],
          address: prodData['address'],
          lot_price: prodData['lot_price'],
          total_investor: prodData['total_investor'],
          remaining_unit: prodData['remaining_unit'],
          progress_percentage: prodData['progress_percentage'],
          total_purchased: prodData['total_purchased'],
          remaining_days: prodData['remaining_days'],
          business_document: prodData['business_document'],
          img_file: prodData['img_file'],
        ));
      });
      bisnisList = loadedBisnis;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
