// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

import '/src/data/models/meal_model.dart';

class OrderModel extends Equatable {
  int? _id;
  int? _tableId;
  MealModel? _meal;
  int? _quantity;

  OrderModel({
    int? id,
    int? tableId,
    MealModel? meal,
    int? quantity,
  })  : _id = id,
        _tableId = tableId,
        _meal = meal,
        _quantity = quantity;

  int? get id => _id;
  int? get tableId => _tableId;
  MealModel? get meal => _meal;
  int? get quantity => _quantity;

  set setTableId(int? value) {
    _tableId = value;
  }

  set setMeal(MealModel? value) {
    _meal = value;
  }

  set setQuantity(int? value) {
    _quantity = value;
  }

  OrderModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _tableId = json['table_id'];
    _meal = json['meal'] != null ? MealModel.fromJson(json['meal']) : null;
    _quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['table_id'] = _tableId;
    data['meal'] = _meal?.toJson();
    data['quantity'] = _quantity;
    return data;
  }

  @override
  List<Object?> get props => [
        _id,
        _tableId,
        _meal,
        _quantity,
      ];
}
