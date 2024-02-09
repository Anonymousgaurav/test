import 'package:audit_task/presentation/widgets/audit_factory.dart';
import 'package:audit_task/utils/DeviceUtils.dart';
import 'package:audit_task/utils/WidgetFactory.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/AuditController.dart';
import '../../utils/app_colors.dart';
import '../widgets/audit_header.dart';
import '../widgets/audit_header_status.dart';

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
              title: const Align(
                  alignment: Alignment.centerRight, child: AuditHeader()),
              backgroundColor: Colors.white,
              elevation: 0.0,
            ),
            body: RefreshIndicator(
              onRefresh: () async {
                Get.find<AuditController>()
                    .fetchDataFromUseCase(refreshData: true);
              },
              child: Container(
                padding:
                const EdgeInsets.only(
                    left: _Dimens.PADDING_LEFT,
                    top: _Dimens.PADDING_TOP,
                    right: _Dimens.PADDING_RIGHT),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('My Audit'),
                    const Text('Internal Audit'),
                    SizedBox(
                      height:
                      DeviceUtils.fractionHeight(context, fraction: 30.0),
                    ),
                    Expanded(
                      child: GetX<AuditController>(
                        builder: (controller) {
                          if (controller.isLoading.value) {
                            return WidgetFactory.buildLoading();
                          } else {
                            return Obx(
                                  () => ListView.builder(
                                itemCount: controller.dataList.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                    elevation: 6.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      side: const BorderSide(
                                        color: Colors.white, // Border color
                                        width: 2.0, // Border width
                                      ),
                                    ),
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          top: _Dimens.MARGIN_TOP,
                                          left: _Dimens.MARGIN_LEFT,
                                          right: _Dimens.MARGIN_LEFT,),
                                      height: DeviceUtils.fractionHeight(context,fraction: 3.8),
                                      width: double.infinity,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          AuditHeaderStatus(controller.dataList[index]),
                                          WidgetFactory.divider(context),
                                          Text(controller.dataList[index].auditName!),
                                          WidgetFactory.emptyBox(height: 6.0),
                                          Text(controller
                                              .dataList[index]
                                              .auditNumber ??
                                              "Audit number not available"),
                                          WidgetFactory.emptyBox(height: 6.0),
                                           AuditFactory.rowWidget(controller.dataList[index].plantName),
                                          WidgetFactory.emptyBox(height: 6.0),
                                          const Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text('Audit Coordinator: '),
                                              Text("Name")
                                            ],
                                          ),
                                          WidgetFactory.divider(context),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              ElevatedButton(
                                                onPressed: (){},
                                                style: ElevatedButton.styleFrom(
                                                  foregroundColor: Colors.white, minimumSize: const Size(20, 50), backgroundColor: Colors.orange,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                ),
                                                child: const Text('Offsite'),
                                              ),
                                              WidgetFactory.emptyBox(width: 15.0),
                                              ElevatedButton(
                                                onPressed: ()
                                                {

                                                },
                                                style: ElevatedButton.styleFrom(
                                                  foregroundColor: Colors.white, minimumSize: const Size(20, 50), backgroundColor: AppColors.primaryGreen,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                ),
                                                child: const Text('Clear'),
                                              ),
                                              WidgetFactory.emptyBox(width: 15.0),

                                              const Icon(Icons.remove_red_eye_sharp, color: Colors.black, size: 30,)
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
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
      },
    );
  }
}

abstract class _Dimens {
  static const double MARGIN_TOP = 20.0;
  static const double MARGIN_LEFT = 8.0;
  static const double PADDING_LEFT = 14.0;
  static const double PADDING_TOP = 10.0;
  static const double PADDING_RIGHT = 14.0;
}
