// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class MealModel extends Equatable {
  int? _id;
  String? _title;
  int? _price;

  MealModel({
    int? id,
    String? title,
    int? price,
  })  : _id = id,
        _title = title,
        _price = price;

  int? get id => _id;
  String? get title => _title;
  int? get price => _price;

  set setPrice(int? value) {
    _price = value;
  }

  set setTitle(String? value) {
    _title = value;
  }

  MealModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['title'] = _title;
    data['price'] = _price;
    return data;
  }

  @override
  List<Object?> get props => [
        _id,
        _title,
        _price,
      ];
}
