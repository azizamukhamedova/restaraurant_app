// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class TableModel extends Equatable {
  int? _id;
  String? _title;
  String? _status;
  bool? _hasStarted;
  bool? _hasGivenBill;

  TableModel({
    int? id,
    String? title,
    String? status,
    bool? hasStarted,
    bool? hasGivenBill,
  })  : _id = id,
        _title = title,
        _status = status,
        _hasStarted = hasStarted,
        _hasGivenBill = hasGivenBill;

  int? get id => _id;
  String? get title => _title;
  String? get status => _status;
  bool? get hasStarted => _hasStarted;
  bool? get hasGivenBill => _hasGivenBill;

  set setTitle(String? value) {
    _title = value;
  }

  set setStatus(String? value) {
    _status = value;
  }

  TableModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['title'] = _title;
    data['status'] = _status;
    return data;
  }

  @override
  List<Object?> get props => [
        _id,
        _title,
        _status,
        _hasStarted,
        _hasGivenBill,
      ];
}
