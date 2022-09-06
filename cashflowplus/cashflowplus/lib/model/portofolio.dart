import 'package:flutter/foundation.dart';

class Portofolio {
  late int? customers_business_id;
  late String? bisnis_id;
  late String? transaction_id;
  late final String customer_id;
  late int? purchased_lot;
  late String? purchase_status;
  late DateTime? purchase_date;
  late String? bisnis_name;

  Portofolio(
      {this.customers_business_id,
      required this.customer_id,
      this.purchased_lot,
      this.purchase_status,
      this.purchase_date,
      this.bisnis_id,
      this.bisnis_name});

  factory Portofolio.fromJson(Map<String, dynamic> json) => Portofolio(
      customers_business_id: json['transaction_id'] ?? 0,
      bisnis_id: json['bisnis_id'] ?? '',
      customer_id: json['customer_id'] ?? '',
      purchased_lot: json['lot_amount'] ?? '',
      purchase_status: json['lot_value'] ?? '',
      purchase_date: json['purchase_date'] ?? '');

  Map<String, dynamic> toJson() {
    var map = {
      'transaction_id': this.customers_business_id ?? '',
      'bisnis_id': this.bisnis_id ?? '',
      'customer_id': this.customer_id ?? ''
    };

    if (map['transaction_id'] != null)
      map['transaction_id'] = this.customers_business_id ?? '';

    return map;
  }
}
