import 'package:cashflowplus/repository/bisnis_repository.dart';
import 'package:flutter/material.dart';
import '../model/bisnis.dart';
import 'dart:convert';
import '.././config/constant/api_url.dart';

import 'package:http/http.dart' as http;

import '../model/http_exception.dart';

class BisnisProvider with ChangeNotifier {
  final _bisnisRepository = BisnisRepository();
  List<Bisnis>? bisnisList;
  Bisnis? bisnis;
  static String mainUrl = API.MAIN_URL;
  Bisnis? prevBisnis;

  BisnisProvider({this.bisnisList, this.bisnis});

  getBisniss() => this.bisnisList;
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

  Future<void> fetchBisnisList() async {
    this.bisnisList = await _bisnisRepository.getBisnisList();
    notifyListeners();
  }

  Future<void> fetchBisnis({Bisnis? bisnis}) async {
    this.bisnis = await _bisnisRepository.getBisnis(bisnis!.business_id);
    this.prevBisnis = bisnis;
    notifyListeners();
  }

  Future<void> fetchAndSetBisnis() async {
    //final filterString = filterByUser ? 'orderBy="creatorId"&equalTo=""' : '';
    //var headers = {"Authorization": "$authToken"};

    var url = Uri.http('$mainUrl', '/transaction/listTransaction');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      final List<Transactions> loadedTransactions = [];
      extractedData.forEach((prodId, prodData) {
        loadedTransactions.add(Transactions(
          transaction_id: prodData['transaction_id'],
          customer_id: prodData['customer_id'],
          lot_amount: int.parse(prodData['lot_amount']),
          lot_value: int.parse(prodData['lot_amount']),
          subtotal: prodData['transaction_id'],
          bisnis_id: prodData['bisnis_id'],
          bisnis_name: prodData['bisnis_name'],
          status: prodData['status'],
        ));
      });
      transactionList = loadedTransactions;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
