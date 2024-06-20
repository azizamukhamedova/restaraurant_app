// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class OrderModel extends Equatable {
  int? _id;
  int? _tableId;
  int? _mealId;

  OrderModel({
    int? id,
    int? tableId,
    int? mealId,
  })  : _id = id,
        _tableId = tableId,
        _mealId = mealId;

  int? get id => _id;
  int? get tableId => _tableId;
  int? get mealId => _mealId;

  set setTableId(int? value) {
    _tableId = value;
  }

  set setMealId(int? value) {
    _mealId = value;
  }

  OrderModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _tableId = json['table_id'];
    _mealId = json['meal_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['table_id'] = _tableId;
    data['meal_id'] = _mealId;
    return data;
  }

  @override
  List<Object?> get props => [
        _id,
        _tableId,
        _mealId,
      ];
}
