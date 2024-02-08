import 'package:audit_task/utils/date_time_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/AuditController.dart';
import 'filter_screen.dart';

class AuditScreen extends StatelessWidget {
   const AuditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuditController>(
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.find<AuditController>().fetchDataFromUseCase(refreshData: true);
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
                          Get.find<AuditController>().tempSearchable.clear();
                          Get.find<AuditController>().tempSearchable.addAll(Get.find<AuditController>().searchableAuditNumbers);
                          Get.to(FilterScreen());
                        },
                        child: const Icon(
                          Icons.filter,
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
            body: RefreshIndicator(
              onRefresh: () async
              {
                Get.find<AuditController>().fetchDataFromUseCase(refreshData: true);
              },
              child: Container(
                padding: const EdgeInsets.only(left: 14.0, top: 10.0, right: 14.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('My Audit'),
                    const Text('Internal Audit'),
                    const SizedBox(height: 10.0,),
                    Expanded(
                      child: GetX<AuditController>(
                        builder: (controller) {
                          if (kDebugMode) {
                            print('Value controller>??>>>>> ${controller.isLoading.value}');
                          }
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
                            ),);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
