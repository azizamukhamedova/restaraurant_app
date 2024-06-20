// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class BillModel extends Equatable {
  int? _id;
  int? _tableId;

  BillModel({
    int? id,
    int? tableId,
  })  : _id = id,
        _tableId = tableId;

  int? get id => _id;
  int? get tableId => _tableId;

  set setTableId(int? value) {
    _tableId = value;
  }

  BillModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _tableId = json['table_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['table_id'] = _tableId;
    return data;
  }

  @override
  List<Object?> get props => [
        _id,
        _tableId,
      ];
}
