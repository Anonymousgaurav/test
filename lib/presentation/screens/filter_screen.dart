import 'package:audit_task/controller/AuditController.dart';
import 'package:audit_task/models/AuditModel.dart';
import 'package:audit_task/presentation/screens/audit_screen.dart';
import 'package:audit_task/presentation/widgets/custom_multi_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../controller/FilterController.dart';
import '../../utils/app_colors.dart';
import '../../utils/constant.dart';
import '../../utils/date_time_helper.dart';
import '../../utils/ui_helpers.dart';
import 'package:get/get.dart';

class FilterScreen extends StatelessWidget {
  FilterScreen({super.key});

  int selectedContainerIndex = -1;

  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  DateTime? _startDate;
  DateTime? _endDate;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FilterController>(
      init: FilterController(),
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            body: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Filters',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      verticalSpaceMedium,
                      const Text(
                        'Status',
                        style: TextStyle(fontSize: 20),
                      ),
                      verticalSpaceMedium,
                      Wrap(
                        spacing: 10, // Spacing between containers
                        runSpacing: 10, // Spacing between rows
                        children: [
                          customContainer(
                            child: const Text('All'),
                            height: 50,
                            width: 50,
                            color: selectedContainerIndex == 0
                                ? Colors.green
                                : Colors.white,
                            radius: 5,
                            onTap: () {},
                          ),
                          customContainer(
                            child: const Text('Rejected'),
                            height: 50,
                            width: 80,
                            color: selectedContainerIndex == 1
                                ? Colors.green
                                : Colors.transparent,
                            radius: 5,
                            onTap: () {},
                          ),
                          customContainer(
                            child: const Text('Requested'),
                            height: 50,
                            width: 80,
                            color: selectedContainerIndex == 2
                                ? Colors.green
                                : Colors.transparent,
                            radius: 10,
                            onTap: () {},
                          ),
                          customContainer(
                            child: const Text('Released'),
                            height: 50,
                            width: 80,
                            color: selectedContainerIndex == 3
                                ? Colors.green
                                : Colors.transparent,
                            radius: 5,
                            onTap: () {},
                          ),
                          customContainer(
                            child: const Text('Submitted'),
                            height: 50,
                            width: 80,
                            color: selectedContainerIndex == 4
                                ? Colors.green
                                : Colors.transparent,
                            radius: 5,
                            onTap: () {},
                          ),
                          customContainer(
                            child: const Text('Closed'),
                            height: 50,
                            width: 80,
                            color: selectedContainerIndex == 5
                                ? Colors.green
                                : Colors.transparent,
                            radius: 5,
                            onTap: () {},
                          ),
                        ],
                      ),
                      verticalSpaceMedium,
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              readOnly: true,
                              controller: startDateController,
                              decoration: InputDecoration(
                                labelText: 'From',
                                hintText: startDateController.text.isEmpty
                                    ? 'Start Date'
                                    : startDateController.text,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                suffixIcon: IconButton(
                                    onPressed: () => _selectStartDate(context),
                                    icon: Icon(Icons.calendar_today)),
                              ),
                            ),
                          ),
                          horizontalSpaceSmall,
                          Expanded(
                            child: TextFormField(
                              readOnly: true,
                              controller: endDateController,
                              decoration: InputDecoration(
                                labelText: 'To',
                                hintText: endDateController.text.isEmpty
                                    ? 'End Date'
                                    : endDateController.text,
                                fillColor: AppColors.primaryGreen,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                suffixIcon: IconButton(
                                    onPressed: () => _selectEndDate(context),
                                    icon: Icon(Icons.calendar_today)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      verticalSpaceMedium,
                      CustomMultiselectDropDown(
                        listOFStrings: controller.allAuditNumbers,
                        listOFSelectedItem: controller.tempSearchable,
                      ),
                      verticalSpaceMedium,
                      verticalSpaceLarge,
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                controller.searchableAuditNumbers.clear();
                                controller.searchableAuditNumbers
                                    .addAll(controller.tempSearchable);
                                controller.filterItems(controller.auditList,
                                    controller.searchableAuditNumbers);
                                print(
                                    'searchable items >>>> ${controller.searchableAuditNumbers}');
                                Get.to(() => const AuditScreen());
                              },
                              child: Text('Apply'),
                              style: ElevatedButton.styleFrom(
                                primary: AppColors.primaryGreen,
                                onPrimary: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          horizontalSpaceMedium,
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text('Clear'),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.grey,
                                onPrimary: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      verticalSpaceLarge
                    ],
                  ),
                )),
          ),
        );
      },
    );
  }

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked =
        await DateTimeHelper.selectDate(context, _startDate);
    if (picked != null && picked != _startDate) {
      _startDate = picked;
      startDateController.text = DateFormat('yy/MMM/dd').format(_startDate!);
      // setState(() {
      //   _startDate = picked;
      //   startDateController.text = DateFormat('yy/MMM/dd').format(_startDate!);
      // });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await DateTimeHelper.selectDate(context, _endDate);
    if (picked != null && picked != _endDate) {
      _endDate = picked;
      endDateController.text = DateFormat('yy/MMM/dd').format(_endDate!);
      // setState(() {
      //   _endDate = picked;
      //   endDateController.text = DateFormat('yy/MMM/dd').format(_endDate!);
      // });
    }
  }

  Widget buildDropdown(AuditModel audit) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpaceMedium,
            DropdownButtonFormField<String>(
              value: null,
              decoration: InputDecoration(
                labelText: 'Plant Name',
                filled: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              items: [
                // DropdownMenuItem<String>(
                //   value: audit.plantName.toString().split('.').last,
                //   child: Text(audit.plantName.toString().split('.').last),
                // ),
              ],
              onChanged: (String? newValue) {
                // Handle dropdown value changes
              },
            ),
            verticalSpaceMedium,
            DropdownButtonFormField<String>(
              value: null,
              decoration: InputDecoration(
                labelText: 'Supplier Name',
                filled: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              items: [
                // DropdownMenuItem<String>(
                //   value: audit.supplierName.toString().split('.').last,
                //   child: Text(audit.supplierName.toString().split('.').last),
                // ),
              ],
              onChanged: (String? newValue) {
                // Handle dropdown value changes
              },
            ),
            verticalSpaceMedium,
            DropdownButtonFormField<String>(
              value: null,
              decoration: InputDecoration(
                labelText: 'Audit Type Name',
                filled: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              items: [
                DropdownMenuItem<String>(
                  value: audit.auditTypeName.toString().split('.').last,
                  child: Text(audit.auditTypeName.toString().split('.').last),
                ),
              ],
              onChanged: (String? newValue) {
                // Handle dropdown value changes
              },
            ),
          ],
        ),
      ),
    );
  }
}
