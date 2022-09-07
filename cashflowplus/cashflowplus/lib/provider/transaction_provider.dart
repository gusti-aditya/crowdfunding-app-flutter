import 'dart:convert';
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import '.././config/constant/api_url.dart';
import '../model/transaction.dart';
import '../model/http_exception.dart';

class TransactionProvider with ChangeNotifier {
  late String transactionId = '';
  static String mainUrl = API.MAIN_URL;
  final String authToken;
  List<Transactions>? transactionList;
  Transactions? transaction;
  TransactionProvider(
      {this.transactionList, this.transaction, required this.authToken});

  getTransactions() => this.transactionList;
  setTransactions(List<Transactions> bisnisList) =>
      this.transactionList = bisnisList;

  getBisnis() => this.transaction;
  setBisnis(Transactions bisnis) => this.transaction = bisnis;

  List<Transactions> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [...?transactionList];
  }

  Transactions findById(String id) {
    return transactionList!.firstWhere((prod) => prod.transaction_id == id);
  }
/*
  Future<void> fetchBisnisList() async {
    this.transactionList = await _bisnisRepository.getBisnisList();
    notifyListeners();
  }

  Future<void> fetchBisnis({Transactions? trx}) async {
    this.transaction =
        await _bisnisRepository.getBisnis(transaction!.transaction_id);
    notifyListeners();
  }
  */

  Future<void> fetchAndSetTransactions() async {
    //final filterString = filterByUser ? 'orderBy="creatorId"&equalTo=""' : '';
    var headers = {"Authorization": "$authToken"};

    var url = Uri.http('$mainUrl', '/transaction/listTransaction', headers);
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
