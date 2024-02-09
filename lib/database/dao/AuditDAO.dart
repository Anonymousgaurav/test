
import '../../models/AuditModel.dart';
import '../AuditDatabase.dart';

class AuditDAO {
  final AuditDatabase dbProvider;

  AuditDAO([AuditDatabase? dbProvider])
      : dbProvider = dbProvider ?? AuditDatabase.dbProvider;


  Future<void> insertAudit(String tablename, AuditModel audit) async {
    final db = await dbProvider.database;
    await db.insert(tablename, audit.toMap());
  }
  Future<List<AuditModel>> getData(String tableName) async {
    final db = await dbProvider.database;
    final List<Map<String, dynamic>> maps = await db.query(tableName);
    return List.generate(maps.length, (index) {
      return AuditModel.fromJson(maps[index]);
    });
  }

  Future<bool> deleteTable(String tableName) async {
    final db = await dbProvider.database;
    await db.delete(tableName);
    return true;
  }

}
