import 'package:flutter/foundation.dart';

class Bisnis {
  late final String business_id;
  late final String business_name;
  late final String owner_contact;
  late final String yield_period;
  late final String yield_percentage;
  late final String due_date;
  late final String description;
  late final String business_category;
  late final String publisher;
  late final String business_value;
  late final String max_unit;
  late final String address;
  late final String lot_price;
  late final String total_investor;
  late final String remaining_unit;
  late final String progress_percentage;
  late final String total_purchased;
  late final String remaining_days;
  late final String business_document;
  late final String img_file;

  Bisnis(
      {required this.business_id,
      required this.business_name,
      required this.owner_contact,
      required this.yield_period,
      required this.yield_percentage,
      required this.due_date,
      required this.description,
      required this.business_category,
      required this.publisher,
      required this.business_value,
      required this.max_unit,
      required this.img_file,
      required this.lot_price,
      required this.total_investor,
      required this.remaining_unit,
      required this.progress_percentage,
      required this.total_purchased,
      required this.remaining_days,
      required this.business_document,
      required this.address});

  factory Bisnis.fromJson(Map<String, dynamic> json) => Bisnis(
        business_id: json['business_id'] ?? 0,
        business_name: json['business_name'] ?? '',
        owner_contact: json['owner_contact'] ?? '',
        yield_period: json['yield_period'] ?? '',
        yield_percentage: json['yield_percentage'] ?? '',
        due_date: json['due_date'] ?? '',
        description: json['description'] ?? '',
        business_value: json['business_value'] ?? '',
        business_category: json['business_category'] ?? '',
        publisher: json['publisher'] ?? '',
        max_unit: json['max_unit'] ?? '',
        img_file: json['img_file'] ?? '',
        address: json['address'] ?? '',
        lot_price: json['lot_price'] ?? '',
        total_investor: json['total_investor'] ?? '',
        total_purchased: json['total_purchased'] ?? '',
        progress_percentage: json['progress_percentage'] ?? '',
        remaining_days: json['remaining_days'] ?? '',
        remaining_unit: json['remaining_unit'] ?? '',
        business_document: json['business_document'] ?? '',
      );

  Map<String, dynamic> toJson() {
    var map = {
      'name': this.business_id ?? '',
      'username': this.business_name ?? '',
      'email': this.owner_contact ?? ''
    };

    if (map['business_id'] != null) map['business_id'] = this.business_id ?? '';

    return map;
  }
}
