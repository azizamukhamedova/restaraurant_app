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
  @override
  List<GeneratedColumn> get $columns => [id, title, status];
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
  const RestaurantTableData({required this.id, this.title, this.status});
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
    return map;
  }

  RestaurantTableCompanion toCompanion(bool nullToAbsent) {
    return RestaurantTableCompanion(
      id: Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
    );
  }

  factory RestaurantTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RestaurantTableData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String?>(json['title']),
      status: serializer.fromJson<String?>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String?>(title),
      'status': serializer.toJson<String?>(status),
    };
  }

  RestaurantTableData copyWith(
          {int? id,
          Value<String?> title = const Value.absent(),
          Value<String?> status = const Value.absent()}) =>
      RestaurantTableData(
        id: id ?? this.id,
        title: title.present ? title.value : this.title,
        status: status.present ? status.value : this.status,
      );
  @override
  String toString() {
    return (StringBuffer('RestaurantTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RestaurantTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.status == this.status);
}

class RestaurantTableCompanion extends UpdateCompanion<RestaurantTableData> {
  final Value<int> id;
  final Value<String?> title;
  final Value<String?> status;
  const RestaurantTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.status = const Value.absent(),
  });
  RestaurantTableCompanion.insert({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.status = const Value.absent(),
  });
  static Insertable<RestaurantTableData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (status != null) 'status': status,
    });
  }

  RestaurantTableCompanion copyWith(
      {Value<int>? id, Value<String?>? title, Value<String?>? status}) {
    return RestaurantTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      status: status ?? this.status,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RestaurantTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $RestaurantTableTable restaurantTable =
      $RestaurantTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [restaurantTable];
}
