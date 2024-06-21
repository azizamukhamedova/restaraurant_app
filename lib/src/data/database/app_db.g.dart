// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $RestaurantTableTable extends RestaurantTable
    with TableInfo<$RestaurantTableTable, RestaurantTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RestaurantTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _hasStartedMeta =
      const VerificationMeta('hasStarted');
  @override
  late final GeneratedColumn<bool> hasStarted = GeneratedColumn<bool>(
      'has_started', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("has_started" IN (0, 1))'));
  static const VerificationMeta _hasGivenBillMeta =
      const VerificationMeta('hasGivenBill');
  @override
  late final GeneratedColumn<bool> hasGivenBill = GeneratedColumn<bool>(
      'has_given_bill', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("has_given_bill" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, status, hasStarted, hasGivenBill];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'restaurant_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<RestaurantTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('has_started')) {
      context.handle(
          _hasStartedMeta,
          hasStarted.isAcceptableOrUnknown(
              data['has_started']!, _hasStartedMeta));
    }
    if (data.containsKey('has_given_bill')) {
      context.handle(
          _hasGivenBillMeta,
          hasGivenBill.isAcceptableOrUnknown(
              data['has_given_bill']!, _hasGivenBillMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RestaurantTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RestaurantTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status']),
      hasStarted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}has_started']),
      hasGivenBill: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}has_given_bill']),
    );
  }

  @override
  $RestaurantTableTable createAlias(String alias) {
    return $RestaurantTableTable(attachedDatabase, alias);
  }
}

class RestaurantTableData extends DataClass
    implements Insertable<RestaurantTableData> {
  final int id;
  final String? title;
  final String? status;
  final bool? hasStarted;
  final bool? hasGivenBill;
  const RestaurantTableData(
      {required this.id,
      this.title,
      this.status,
      this.hasStarted,
      this.hasGivenBill});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    if (!nullToAbsent || hasStarted != null) {
      map['has_started'] = Variable<bool>(hasStarted);
    }
    if (!nullToAbsent || hasGivenBill != null) {
      map['has_given_bill'] = Variable<bool>(hasGivenBill);
    }
    return map;
  }

  RestaurantTableCompanion toCompanion(bool nullToAbsent) {
    return RestaurantTableCompanion(
      id: Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      hasStarted: hasStarted == null && nullToAbsent
          ? const Value.absent()
          : Value(hasStarted),
      hasGivenBill: hasGivenBill == null && nullToAbsent
          ? const Value.absent()
          : Value(hasGivenBill),
    );
  }

  factory RestaurantTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RestaurantTableData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String?>(json['title']),
      status: serializer.fromJson<String?>(json['status']),
      hasStarted: serializer.fromJson<bool?>(json['hasStarted']),
      hasGivenBill: serializer.fromJson<bool?>(json['hasGivenBill']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String?>(title),
      'status': serializer.toJson<String?>(status),
      'hasStarted': serializer.toJson<bool?>(hasStarted),
      'hasGivenBill': serializer.toJson<bool?>(hasGivenBill),
    };
  }

  RestaurantTableData copyWith(
          {int? id,
          Value<String?> title = const Value.absent(),
          Value<String?> status = const Value.absent(),
          Value<bool?> hasStarted = const Value.absent(),
          Value<bool?> hasGivenBill = const Value.absent()}) =>
      RestaurantTableData(
        id: id ?? this.id,
        title: title.present ? title.value : this.title,
        status: status.present ? status.value : this.status,
        hasStarted: hasStarted.present ? hasStarted.value : this.hasStarted,
        hasGivenBill:
            hasGivenBill.present ? hasGivenBill.value : this.hasGivenBill,
      );
  @override
  String toString() {
    return (StringBuffer('RestaurantTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('status: $status, ')
          ..write('hasStarted: $hasStarted, ')
          ..write('hasGivenBill: $hasGivenBill')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, status, hasStarted, hasGivenBill);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RestaurantTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.status == this.status &&
          other.hasStarted == this.hasStarted &&
          other.hasGivenBill == this.hasGivenBill);
}

class RestaurantTableCompanion extends UpdateCompanion<RestaurantTableData> {
  final Value<int> id;
  final Value<String?> title;
  final Value<String?> status;
  final Value<bool?> hasStarted;
  final Value<bool?> hasGivenBill;
  const RestaurantTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.status = const Value.absent(),
    this.hasStarted = const Value.absent(),
    this.hasGivenBill = const Value.absent(),
  });
  RestaurantTableCompanion.insert({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.status = const Value.absent(),
    this.hasStarted = const Value.absent(),
    this.hasGivenBill = const Value.absent(),
  });
  static Insertable<RestaurantTableData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? status,
    Expression<bool>? hasStarted,
    Expression<bool>? hasGivenBill,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (status != null) 'status': status,
      if (hasStarted != null) 'has_started': hasStarted,
      if (hasGivenBill != null) 'has_given_bill': hasGivenBill,
    });
  }

  RestaurantTableCompanion copyWith(
      {Value<int>? id,
      Value<String?>? title,
      Value<String?>? status,
      Value<bool?>? hasStarted,
      Value<bool?>? hasGivenBill}) {
    return RestaurantTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      status: status ?? this.status,
      hasStarted: hasStarted ?? this.hasStarted,
      hasGivenBill: hasGivenBill ?? this.hasGivenBill,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (hasStarted.present) {
      map['has_started'] = Variable<bool>(hasStarted.value);
    }
    if (hasGivenBill.present) {
      map['has_given_bill'] = Variable<bool>(hasGivenBill.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RestaurantTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('status: $status, ')
          ..write('hasStarted: $hasStarted, ')
          ..write('hasGivenBill: $hasGivenBill')
          ..write(')'))
        .toString();
  }
}

class $BillTable extends Bill with TableInfo<$BillTable, BillData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BillTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _tableIdMeta =
      const VerificationMeta('tableId');
  @override
  late final GeneratedColumn<int> tableId = GeneratedColumn<int>(
      'table_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _tableTitleMeta =
      const VerificationMeta('tableTitle');
  @override
  late final GeneratedColumn<String> tableTitle = GeneratedColumn<String>(
      'table_title', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, tableId, tableTitle];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bill';
  @override
  VerificationContext validateIntegrity(Insertable<BillData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('table_id')) {
      context.handle(_tableIdMeta,
          tableId.isAcceptableOrUnknown(data['table_id']!, _tableIdMeta));
    }
    if (data.containsKey('table_title')) {
      context.handle(
          _tableTitleMeta,
          tableTitle.isAcceptableOrUnknown(
              data['table_title']!, _tableTitleMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BillData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BillData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      tableId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}table_id']),
      tableTitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}table_title']),
    );
  }

  @override
  $BillTable createAlias(String alias) {
    return $BillTable(attachedDatabase, alias);
  }
}

class BillData extends DataClass implements Insertable<BillData> {
  final int id;
  final int? tableId;
  final String? tableTitle;
  const BillData({required this.id, this.tableId, this.tableTitle});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || tableId != null) {
      map['table_id'] = Variable<int>(tableId);
    }
    if (!nullToAbsent || tableTitle != null) {
      map['table_title'] = Variable<String>(tableTitle);
    }
    return map;
  }

  BillCompanion toCompanion(bool nullToAbsent) {
    return BillCompanion(
      id: Value(id),
      tableId: tableId == null && nullToAbsent
          ? const Value.absent()
          : Value(tableId),
      tableTitle: tableTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(tableTitle),
    );
  }

  factory BillData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BillData(
      id: serializer.fromJson<int>(json['id']),
      tableId: serializer.fromJson<int?>(json['tableId']),
      tableTitle: serializer.fromJson<String?>(json['tableTitle']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'tableId': serializer.toJson<int?>(tableId),
      'tableTitle': serializer.toJson<String?>(tableTitle),
    };
  }

  BillData copyWith(
          {int? id,
          Value<int?> tableId = const Value.absent(),
          Value<String?> tableTitle = const Value.absent()}) =>
      BillData(
        id: id ?? this.id,
        tableId: tableId.present ? tableId.value : this.tableId,
        tableTitle: tableTitle.present ? tableTitle.value : this.tableTitle,
      );
  @override
  String toString() {
    return (StringBuffer('BillData(')
          ..write('id: $id, ')
          ..write('tableId: $tableId, ')
          ..write('tableTitle: $tableTitle')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, tableId, tableTitle);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BillData &&
          other.id == this.id &&
          other.tableId == this.tableId &&
          other.tableTitle == this.tableTitle);
}

class BillCompanion extends UpdateCompanion<BillData> {
  final Value<int> id;
  final Value<int?> tableId;
  final Value<String?> tableTitle;
  const BillCompanion({
    this.id = const Value.absent(),
    this.tableId = const Value.absent(),
    this.tableTitle = const Value.absent(),
  });
  BillCompanion.insert({
    this.id = const Value.absent(),
    this.tableId = const Value.absent(),
    this.tableTitle = const Value.absent(),
  });
  static Insertable<BillData> custom({
    Expression<int>? id,
    Expression<int>? tableId,
    Expression<String>? tableTitle,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tableId != null) 'table_id': tableId,
      if (tableTitle != null) 'table_title': tableTitle,
    });
  }

  BillCompanion copyWith(
      {Value<int>? id, Value<int?>? tableId, Value<String?>? tableTitle}) {
    return BillCompanion(
      id: id ?? this.id,
      tableId: tableId ?? this.tableId,
      tableTitle: tableTitle ?? this.tableTitle,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (tableId.present) {
      map['table_id'] = Variable<int>(tableId.value);
    }
    if (tableTitle.present) {
      map['table_title'] = Variable<String>(tableTitle.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BillCompanion(')
          ..write('id: $id, ')
          ..write('tableId: $tableId, ')
          ..write('tableTitle: $tableTitle')
          ..write(')'))
        .toString();
  }
}

class $MealTable extends Meal with TableInfo<$MealTable, MealData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MealTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<int> price = GeneratedColumn<int>(
      'price', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, title, price];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'meal';
  @override
  VerificationContext validateIntegrity(Insertable<MealData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MealData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MealData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title']),
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}price']),
    );
  }

  @override
  $MealTable createAlias(String alias) {
    return $MealTable(attachedDatabase, alias);
  }
}

class MealData extends DataClass implements Insertable<MealData> {
  final int id;
  final String? title;
  final int? price;
  const MealData({required this.id, this.title, this.price});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<int>(price);
    }
    return map;
  }

  MealCompanion toCompanion(bool nullToAbsent) {
    return MealCompanion(
      id: Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      price:
          price == null && nullToAbsent ? const Value.absent() : Value(price),
    );
  }

  factory MealData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MealData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String?>(json['title']),
      price: serializer.fromJson<int?>(json['price']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String?>(title),
      'price': serializer.toJson<int?>(price),
    };
  }

  MealData copyWith(
          {int? id,
          Value<String?> title = const Value.absent(),
          Value<int?> price = const Value.absent()}) =>
      MealData(
        id: id ?? this.id,
        title: title.present ? title.value : this.title,
        price: price.present ? price.value : this.price,
      );
  @override
  String toString() {
    return (StringBuffer('MealData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, price);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MealData &&
          other.id == this.id &&
          other.title == this.title &&
          other.price == this.price);
}

class MealCompanion extends UpdateCompanion<MealData> {
  final Value<int> id;
  final Value<String?> title;
  final Value<int?> price;
  const MealCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.price = const Value.absent(),
  });
  MealCompanion.insert({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.price = const Value.absent(),
  });
  static Insertable<MealData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<int>? price,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (price != null) 'price': price,
    });
  }

  MealCompanion copyWith(
      {Value<int>? id, Value<String?>? title, Value<int?>? price}) {
    return MealCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (price.present) {
      map['price'] = Variable<int>(price.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MealCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }
}

class $OrderTable extends Order with TableInfo<$OrderTable, OrderData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrderTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _tableIdMeta =
      const VerificationMeta('tableId');
  @override
  late final GeneratedColumn<int> tableId = GeneratedColumn<int>(
      'table_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _mealIdMeta = const VerificationMeta('mealId');
  @override
  late final GeneratedColumn<int> mealId = GeneratedColumn<int>(
      'meal_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, tableId, mealId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'order';
  @override
  VerificationContext validateIntegrity(Insertable<OrderData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('table_id')) {
      context.handle(_tableIdMeta,
          tableId.isAcceptableOrUnknown(data['table_id']!, _tableIdMeta));
    }
    if (data.containsKey('meal_id')) {
      context.handle(_mealIdMeta,
          mealId.isAcceptableOrUnknown(data['meal_id']!, _mealIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OrderData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrderData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      tableId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}table_id']),
      mealId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}meal_id']),
    );
  }

  @override
  $OrderTable createAlias(String alias) {
    return $OrderTable(attachedDatabase, alias);
  }
}

class OrderData extends DataClass implements Insertable<OrderData> {
  final int id;
  final int? tableId;
  final int? mealId;
  const OrderData({required this.id, this.tableId, this.mealId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || tableId != null) {
      map['table_id'] = Variable<int>(tableId);
    }
    if (!nullToAbsent || mealId != null) {
      map['meal_id'] = Variable<int>(mealId);
    }
    return map;
  }

  OrderCompanion toCompanion(bool nullToAbsent) {
    return OrderCompanion(
      id: Value(id),
      tableId: tableId == null && nullToAbsent
          ? const Value.absent()
          : Value(tableId),
      mealId:
          mealId == null && nullToAbsent ? const Value.absent() : Value(mealId),
    );
  }

  factory OrderData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrderData(
      id: serializer.fromJson<int>(json['id']),
      tableId: serializer.fromJson<int?>(json['tableId']),
      mealId: serializer.fromJson<int?>(json['mealId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'tableId': serializer.toJson<int?>(tableId),
      'mealId': serializer.toJson<int?>(mealId),
    };
  }

  OrderData copyWith(
          {int? id,
          Value<int?> tableId = const Value.absent(),
          Value<int?> mealId = const Value.absent()}) =>
      OrderData(
        id: id ?? this.id,
        tableId: tableId.present ? tableId.value : this.tableId,
        mealId: mealId.present ? mealId.value : this.mealId,
      );
  @override
  String toString() {
    return (StringBuffer('OrderData(')
          ..write('id: $id, ')
          ..write('tableId: $tableId, ')
          ..write('mealId: $mealId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, tableId, mealId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrderData &&
          other.id == this.id &&
          other.tableId == this.tableId &&
          other.mealId == this.mealId);
}

class OrderCompanion extends UpdateCompanion<OrderData> {
  final Value<int> id;
  final Value<int?> tableId;
  final Value<int?> mealId;
  const OrderCompanion({
    this.id = const Value.absent(),
    this.tableId = const Value.absent(),
    this.mealId = const Value.absent(),
  });
  OrderCompanion.insert({
    this.id = const Value.absent(),
    this.tableId = const Value.absent(),
    this.mealId = const Value.absent(),
  });
  static Insertable<OrderData> custom({
    Expression<int>? id,
    Expression<int>? tableId,
    Expression<int>? mealId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tableId != null) 'table_id': tableId,
      if (mealId != null) 'meal_id': mealId,
    });
  }

  OrderCompanion copyWith(
      {Value<int>? id, Value<int?>? tableId, Value<int?>? mealId}) {
    return OrderCompanion(
      id: id ?? this.id,
      tableId: tableId ?? this.tableId,
      mealId: mealId ?? this.mealId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (tableId.present) {
      map['table_id'] = Variable<int>(tableId.value);
    }
    if (mealId.present) {
      map['meal_id'] = Variable<int>(mealId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrderCompanion(')
          ..write('id: $id, ')
          ..write('tableId: $tableId, ')
          ..write('mealId: $mealId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $RestaurantTableTable restaurantTable =
      $RestaurantTableTable(this);
  late final $BillTable bill = $BillTable(this);
  late final $MealTable meal = $MealTable(this);
  late final $OrderTable order = $OrderTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [restaurantTable, bill, meal, order];
}
