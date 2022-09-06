import 'package:flutter/foundation.dart';

class Transactions {
  late String? transaction_id;
  late final String customer_id;
  late int? lot_amount;
  late int? lot_value;
  late int? subtotal;
  late DateTime? purchase_date;
  late String? status;
  late String? transaction_method;
  late String? transaction_dest;
  late String? transaction_type;
  late String? is_confirmed;
  late String? confirm_file;
  late String? bisnis_id;
  late String? bisnis_name;

  Transactions(
      {this.transaction_id,
      required this.customer_id,
      this.lot_amount,
      this.lot_value,
      this.subtotal,
      this.purchase_date,
      this.status,
      this.transaction_method,
      this.transaction_dest,
      this.is_confirmed,
      this.confirm_file,
      this.bisnis_id,
      this.bisnis_name,
      this.transaction_type});

  factory Transactions.fromJson(Map<String, dynamic> json) => Transactions(
      transaction_id: json['transaction_id'] ?? 0,
      customer_id: json['customer_id'] ?? '',
      lot_amount: json['lot_amount'] ?? '',
      lot_value: json['lot_value'] ?? '',
      subtotal: json['subtotal'] ?? '',
      purchase_date: json['purchase_date'] ?? '',
      status: json['status'] ?? '',
      transaction_method: json['transaction_method'] ?? '',
      transaction_dest: json['transaction_dest'] ?? '',
      is_confirmed: json['is_confirmed'] ?? '',
      confirm_file: json['confirm_file'] ?? '',
      bisnis_id: json['bisnis_id'] ?? '');

  Map<String, dynamic> toJson() {
    var map = {
      'transaction_id': this.transaction_id ?? '',
      'bisnis_id': this.bisnis_id ?? '',
      'customer_id': this.customer_id ?? ''
    };

    if (map['transaction_id'] != null)
      map['transaction_id'] = this.transaction_id ?? '';

    return map;
  }
}
