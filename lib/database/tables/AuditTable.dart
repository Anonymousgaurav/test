import 'package:sqflite/sqflite.dart';

class AuditTable {
  static const String AUDIT_TABLE_NAME = "AUDIT";
  static const String AUDIT_STATUS = "auditStaus";
  static const String AUDIT_NAME = "auditName";
  static const String AUDIT_NUMBER = "auditNumber";
  static const String AUDIT_TYPE = "audit_type";
  static const String SUPPLIER_NAME = "supplierName";
  static const String TEMPLATE_NAME = "template_name";
  static const String AUDIT_TYPE_NAME = "auditTypeName";
  static const String AUDIT_REQUEST_DATE = "requestDate";

  static void createTable(Database database, int version) async {
    await database.execute('''
          CREATE TABLE $AUDIT_TABLE_NAME (
            id INTEGER PRIMARY KEY,
            $AUDIT_REQUEST_DATE TEXT,
            $AUDIT_STATUS TEXT,
            $AUDIT_NAME TEXT,
            $AUDIT_NUMBER TEXT
          )
        ''');
  }
}
