import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../database/dao/AuditDAO.dart';
import '../database/tables/AuditTable.dart';
import '../models/AuditModel.dart';

class AuditController extends GetxController {
  final AuditDAO _auditDAO = AuditDAO();
  //TODO: dataList = filtered
  List<AuditModel> get dataList => _dataList.value;
  List<AuditModel> originalList = [];

  final Dio dio = Dio();
  final String apiUrl = 'https://qasensata.empowerqlm.com/api/Mobile/Supplier/Audit/All/Complete/Details/100003';
  RxBool isLoading = true.obs;
  RxList<AuditModel> auditList = <AuditModel>[].obs;
  RxList<AuditModel> _dataList = <AuditModel>[].obs;
  RxList<String> auditNumbers = <String>[].obs;
  List<String> searchableAuditNumbers =[];
  List<String> tempSearchable =[];
  /// static AuditController get to => Get.find<AuditController>();


  @override
  void onInit() {
    fetchAuditData(forceReload: false);
    super.onInit();
  }


  Future<void> fetchAuditData({bool forceReload = false}) async {
    isLoading.value = true;
    try {
      if (forceReload) {
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
      originalList.clear();
      originalList.addAll(dataList);

      for (var numbers in _dataList) {
        if (numbers.auditNumber != null) {
          auditNumbers.add(numbers.auditNumber!);
        }
      }
      isLoading.value = false;
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching data: $e');
      }
      isLoading.value = false;
    }
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


 void filterItems(List<AuditModel> itemList, List<String> targetCategories) {
    var temp;
    if(targetCategories.isEmpty)
      {
        temp = originalList;
      }
    else{
       temp = itemList.where((item) =>
          targetCategories.contains(item.auditNumber)
      ).toList();
    }
    _dataList.value.clear();
    _dataList.value = temp;
  }

void updateView() => update([]);

}