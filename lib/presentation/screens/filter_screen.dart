import 'package:audit_task/presentation/styles/AppStyles.dart';
import 'package:audit_task/presentation/widgets/custom_multi_drop_down.dart';
import 'package:audit_task/utils/WidgetFactory.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../controller/FilterController.dart';
import '../../utils/app_colors.dart';
import '../../utils/constant.dart';
import '../../utils/date_time_helper.dart';

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
                  horizontal: _Dimens.H_MARGIN, vertical: _Dimens.V_MARGIN),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Filters', style: AppStyles.filterTitle),
                    Text(
                      'Status',
                      style: AppStyles.subTitle,
                    ),
                    WidgetFactory.emptyBox(height: 10.0),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        customContainer(
                          child: const Text('All'),
                          height: 50,
                          width: 50,
                          color: selectedContainerIndex == 0
                              ? Colors.green
                              : Colors.white,
                          radius: 5,
                          onTap: () {

                          },                        ),
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
                    WidgetFactory.emptyBox(height: 10.0),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  icon: const Icon(Icons.calendar_today)),
                            ),
                          ),
                        ),
                        WidgetFactory.emptyBox(width: 10.0),
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
                                  icon: const Icon(Icons.calendar_today)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    WidgetFactory.emptyBox(height: 10.0),
                    CustomMultiselectDropDown(
                      listOFStrings: controller.allAuditNumbers,
                      listOFSelectedItem: controller.tempSearchable,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return buildDropdown();
                      },
                    ),
                    WidgetFactory.emptyBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: controller.onTapApply,
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.primaryGreen,
                              onPrimary: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text('Apply'),
                          ),
                        ),
                        WidgetFactory.emptyBox(width: 15.0),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: controller.onClear,
                            style: ElevatedButton.styleFrom(
                              primary: Colors.grey,
                              onPrimary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text('Clear'),
                          ),
                        ),
                      ],
                    ),
                    WidgetFactory.emptyBox(height: 40.0),
                  ],
                ),
              ),
            ),
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
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await DateTimeHelper.selectDate(context, _endDate);
    if (picked != null && picked != _endDate) {
      _endDate = picked;
      endDateController.text = DateFormat('yy/MMM/dd').format(_endDate!);
    }
  }

  Widget buildDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WidgetFactory.emptyBox(height: 15.0),
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

              ],
              onChanged: (String? newValue) {},
            ),
            WidgetFactory.emptyBox(height: 15.0),
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

              ],
              onChanged: (String? newValue) {
                // Handle dropdown value changes
              },
            ),
            WidgetFactory.emptyBox(height: 15.0),
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

abstract class _Dimens {
  static const double H_MARGIN = 20.0;
  static const double V_MARGIN = 20.0;
}
