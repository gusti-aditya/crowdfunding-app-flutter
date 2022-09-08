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
    try {
      var url = Uri.http(mainUrl, '/bisnis/getBusiness');
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      var extractData = extractedData['data'] as List;
      //final List<Bisnis> loadedBisnis = [];
      List<Bisnis> _bisnis = extractData.isNotEmpty
          ? extractData.map((bisnis) => Bisnis.fromJson(bisnis)).toList()
          : [];
      bisnisList = _bisnis;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
