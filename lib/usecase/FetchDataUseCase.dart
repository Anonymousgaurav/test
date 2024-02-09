import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../database/dao/AuditDAO.dart';
import '../database/tables/AuditTable.dart';
import '../models/AuditModel.dart';

class FetchDataUseCase {
  final AuditDAO _auditDAO = AuditDAO();
  List<AuditModel> get dataList => _dataList.value;

  final Dio dio = Dio();
  final String apiUrl =
      'https://qasensata.empowerqlm.com/api/Mobile/Supplier/Audit/All/Complete/Details/100003';
  RxBool isLoading = true.obs;
  RxList<AuditModel> auditList = <AuditModel>[].obs;
  final RxList<AuditModel> _dataList = <AuditModel>[].obs;

  Future<List<AuditModel>> fetchAuditData({bool refreshData = false}) async {
    isLoading.value = true;
    try {
      if (refreshData) {
        await _auditDAO.deleteTable(AuditTable.AUDIT_TABLE_NAME);
      }
      List<AuditModel> dataFromDatabase =
          await _auditDAO.getData(AuditTable.AUDIT_TABLE_NAME);
      if (dataFromDatabase.isEmpty) {
        Response response = await dio.get(apiUrl, options: _getOptions());
        if (response.statusCode == 200) {
          final dataFromApi = await fetchDataFromApi(response);
          dataFromApi.forEach((category) {
            _auditDAO.insertAudit(AuditTable.AUDIT_TABLE_NAME, category);
          });
          _dataList.value.clear();
          response.data.forEach((element) {
            _dataList.value.add(AuditModel.fromJson(element));
          });
        } else {
          if (kDebugMode) {
            print('Error: ${response.statusCode}');
          }
        }
      } else {
        _dataList.assignAll(dataFromDatabase);
      }
      isLoading.value = false;
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching data: $e');
      }
      isLoading.value = false;
    }

    return _dataList.value;
  }

  Options _getOptions() {
    String token =
        'Bearer 68d420488470fb5305cad01a6fc7238cb5737005298daabb8bb4a3ac1c994178~1000003';
    return Options(
      headers: {'Authorization': token},
    );
  }

  Future<List<AuditModel>> fetchDataFromApi(Response response) async {
    List<dynamic> jsonData = response.data;
    auditList
        .assignAll(jsonData.map((json) => AuditModel.fromJson(json)).toList());
    return auditList;
  }
}
