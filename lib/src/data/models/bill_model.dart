// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class BillModel extends Equatable {
  int? _id;
  int? _tableId;
  String? _tableTitle;

  BillModel({
    int? id,
    int? tableId,
    String? tableTitle,
  })  : _id = id,
        _tableId = tableId,
        _tableTitle = tableTitle;

  int? get id => _id;
  int? get tableId => _tableId;
  String? get tableTitle => _tableTitle;

  set setTableId(int? value) {
    _tableId = value;
  }

  set setTableTitle(String? value) {
    _tableTitle = value;
  }

  BillModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _tableId = json['table_id'];
    _tableTitle = json['table_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['table_id'] = _tableId;
    data['table_title'] = _tableTitle;
    return data;
  }

  @override
  List<Object?> get props => [
        _id,
        _tableId,
        _tableTitle,
      ];
}
