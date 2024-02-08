import 'package:audit_task/utils/date_time_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/AuditController.dart';
import 'filter_screen.dart';

class AuditScreen extends StatelessWidget {
   AuditScreen({super.key});

  final auditController = Get.put(AuditController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.circular(9.0),
                  ),
                  child: const Center(child: Icon(Icons.arrow_back_ios_new))),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      auditController.fetchAuditData(forceReload: true);
                    },
                    child: const Icon(
                      Icons.refresh,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  InkWell(
                    onTap: () {
                      auditController.tempSearchable.clear();
                      auditController.tempSearchable.addAll(auditController.searchableAuditNumbers);
                      Get.to(FilterScreen());
                    },
                    child: const Icon(
                      Icons.double_arrow,
                      color: Colors.black,
                    ),
                  )
                ],
              )
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 14.0, top: 10.0, right: 14.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('My Audit'),
              const Text('Internal Audit'),
              Expanded(
                child: GetX<AuditController>(
                  builder: (controller) {
                    if (controller.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return Obx(() => ListView.builder(
                        itemCount: controller.dataList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 6.0,
                            child: Container(
                              margin: const EdgeInsets.only(
                                  top: 20.0, left: 8.0, right: 8.0),
                              height: 200.0,
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(Icons.calendar_today),
                                          const SizedBox(
                                            width: 6.0,
                                          ),
                                          Text(DateTimeHelper
                                              .getFormattedDate(
                                              DateTime.parse(controller
                                                  .dataList[index]
                                                  .reqDate!)))
                                        ],
                                      ),
                                      Text(controller
                                          .dataList[index].auditStatus!)
                                    ],
                                  ),
                                  const Divider(
                                    color: Colors.black,
                                  ),
                                  Text(controller
                                      .dataList[index].auditName!),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  Visibility(
                                    visible: controller
                                        .dataList[index].auditNumber !=
                                        null,
                                    child: Text(controller
                                        .dataList[index].auditNumber ??
                                        ""),
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  const Row(
                                    children: [
                                      Text('Plant: '),
                                      Text("Nameee")
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 4.0,
                                  ),
                                  const Row(
                                    children: [
                                      Text('Audit Coordinator: '),
                                      Text("Name")
                                    ],
                                  ),
                                  const Divider(
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
