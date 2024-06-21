import 'package:drift/drift.dart';

import '/src/data/database/app_db.dart';

/// models
import '/src/data/models/bill_model.dart';
import '/src/data/models/table_model.dart';

abstract class BillLocalDatasource {
  Future<List<BillModel>> fetchBills();
  Future<void> createBill({
    required TableModel table,
  });
  Future<void> deleteBill({
    required int id,
  });
}

class BillLocalDatasourceImpl extends BillLocalDatasource {
  final AppDatabase db;

  BillLocalDatasourceImpl({required this.db});

  @override
  Future<List<BillModel>> fetchBills() async {
    List<BillData> list = await db.select(db.bill).get();
    return list.map(
      (el) {
        return BillModel(
          id: el.id,
          tableId: el.tableId,
          tableTitle: el.tableTitle,
        );
      },
    ).toList();
  }

  @override
  Future<void> createBill({
    required TableModel table,
  }) async {
    await db.into(db.bill).insert(
          BillCompanion.insert(
            tableId: Value(table.id),
            tableTitle: Value(table.title),
          ),
        );
  }

  @override
  Future<void> deleteBill({
    required int id,
  }) async {
    await (db.delete(db.bill)..where((tbl) => tbl.id.equals(id))).go();
  }
}
