// class FilterScreen extends StatefulWidget {
//   const FilterScreen({super.key});
//
//   @override
//   State<FilterScreen> createState() => _FilterScreenState();
// }
//
// class _FilterScreenState extends State<FilterScreen> {
//   final controller = Get.put(AuditController());
//   int selectedContainerIndex = -1;
//
//   final TextEditingController startDateController = TextEditingController();
//   final TextEditingController endDateController = TextEditingController();
//
//   DateTime? _startDate;
//   DateTime? _endDate;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {},
//           icon: Icon(
//             Icons.arrow_back,
//             color: Colors.black,
//           ),
//           focusColor: AppColors.primaryGreen,
//         ),
//       ),
//       body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Filters',
//                     style:
//                     TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                 verticalSpaceMedium,
//                 Text(
//                   'Status',
//                   style: TextStyle(fontSize: 20),
//                 ),
//                 verticalSpaceMedium,
//                 Wrap(
//                   spacing: 10, // Spacing between containers
//                   runSpacing: 10, // Spacing between rows
//                   children: [
//                     customContainer(
//                       child: const Text('All'),
//                       height: 50,
//                       width: 50,
//                       color: selectedContainerIndex == 0
//                           ? Colors.green
//                           : Colors.white,
//                       radius: 5,
//                       onTap: () {
//                         setState(() {
//                           selectedContainerIndex = 0;
//                         });
//                       },
//                     ),
//                     customContainer(
//                       child: const Text('Rejected'),
//                       height: 50,
//                       width: 80,
//                       color: selectedContainerIndex == 1
//                           ? Colors.green
//                           : Colors.transparent,
//                       radius: 5,
//                       onTap: () {
//                         setState(() {
//                           selectedContainerIndex = 1;
//                         });
//                       },
//                     ),
//                     customContainer(
//                       child: const Text('Requested'),
//                       height: 50,
//                       width: 80,
//                       color: selectedContainerIndex == 2
//                           ? Colors.green
//                           : Colors.transparent,
//                       radius: 10,
//                       onTap: () {
//                         setState(() {
//                           selectedContainerIndex = 2;
//                         });
//                       },
//                     ),
//                     customContainer(
//                       child: const Text('Released'),
//                       height: 50,
//                       width: 80,
//                       color: selectedContainerIndex == 3
//                           ? Colors.green
//                           : Colors.transparent,
//                       radius: 5,
//                       onTap: () {
//                         setState(() {
//                           selectedContainerIndex = 3;
//                         });
//                       },
//                     ),
//                     customContainer(
//                       child: const Text('Submitted'),
//                       height: 50,
//                       width: 80,
//                       color: selectedContainerIndex == 4
//                           ? Colors.green
//                           : Colors.transparent,
//                       radius: 5,
//                       onTap: () {
//                         setState(() {
//                           selectedContainerIndex = 4;
//                         });
//                       },
//                     ),
//                     customContainer(
//                       child: const Text('Closed'),
//                       height: 50,
//                       width: 80,
//                       color: selectedContainerIndex == 5
//                           ? Colors.green
//                           : Colors.transparent,
//                       radius: 5,
//                       onTap: () {
//                         setState(() {
//                           selectedContainerIndex = 5;
//                         });
//                       },
//                     ),
//                   ],
//                 ),
//                 verticalSpaceMedium,
//                 Row(
//                   children: [
//                     Expanded(
//                       child: TextFormField(
//                         readOnly: true,
//                         controller: startDateController,
//                         decoration: InputDecoration(
//                           labelText: 'From',
//                           hintText: startDateController.text.isEmpty
//                               ? 'Start Date'
//                               : startDateController.text,
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           suffixIcon: IconButton(
//                               onPressed: () => _selectStartDate(context),
//                               icon: Icon(Icons.calendar_today)),
//                         ),
//                       ),
//                     ),
//
//                     horizontalSpaceSmall,
//
//                     Expanded(
//                       child: TextFormField(
//                         readOnly: true,
//                         controller: endDateController,
//                         decoration: InputDecoration(
//                           labelText: 'To',
//                           hintText: endDateController.text.isEmpty
//                               ? 'End Date'
//                               : endDateController.text,
//                           fillColor: AppColors.primaryGreen,
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           suffixIcon: IconButton(
//                               onPressed: () => _selectEndDate(context),
//                               icon: Icon(Icons.calendar_today)),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 verticalSpaceMedium,
//                 CustomMultiselectDropDown(
//                   listOFStrings: controller.auditNumbers,
//                   listOFSelectedItem: controller.tempSearchable,
//                 ),
//                 verticalSpaceMedium,
//                 // ListView.builder(
//                 //   shrinkWrap: true,
//                 //   physics: const NeverScrollableScrollPhysics(),
//                 //   itemCount: 1,
//                 //   itemBuilder: (context, index) {
//                 //     final audit = controller.auditList.value[index];
//                 //     return buildDropdown(audit);
//                 //   },
//                 // ),
//                 verticalSpaceLarge,
//                 Row(
//                   children: [
//                     Expanded(
//                       child: ElevatedButton(
//                         onPressed: () {
//                           controller.searchableAuditNumbers.clear();
//                           controller.searchableAuditNumbers.addAll(controller.tempSearchable);
//
//                           controller.filterItems(controller.originalList, controller.searchableAuditNumbers);
//                           Get.to( AuditScreen());
//                         },
//                         child: Text('Apply'),
//                         style: ElevatedButton.styleFrom(
//                           primary: AppColors.primaryGreen,
//                           onPrimary: Colors.black,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                       ),
//                     ),
//                     horizontalSpaceMedium,
//                     Expanded(
//                       child: ElevatedButton(
//                         onPressed: () {},
//                         child: Text('Clear'),
//                         style: ElevatedButton.styleFrom(
//                           primary: Colors.grey,
//                           onPrimary: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 verticalSpaceLarge
//               ],
//             ),
//           )),
//     );
//   }
//
//   Future<void> _selectStartDate(BuildContext context) async {
//     final DateTime? picked =
//     await DateTimeHelper.selectDate(context, _startDate);
//     if (picked != null && picked != _startDate) {
//       setState(() {
//         _startDate = picked;
//         startDateController.text = DateFormat('yy/MMM/dd').format(_startDate!);
//       });
//     }
//   }
//
//   Future<void> _selectEndDate(BuildContext context) async {
//     final DateTime? picked = await DateTimeHelper.selectDate(context, _endDate);
//     if (picked != null && picked != _endDate) {
//       setState(() {
//         _endDate = picked;
//         endDateController.text = DateFormat('yy/MMM/dd').format(_endDate!);
//       });
//     }
//   }
//
//   Widget buildDropdown(AuditModel audit) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10.0),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(5),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             verticalSpaceMedium,
//             DropdownButtonFormField<String>(
//               value: null,
//               decoration: InputDecoration(
//                 labelText: 'Plant Name',
//                 filled: true,
//                 contentPadding: const EdgeInsets.symmetric(horizontal: 10),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//               ),
//               items: [
//                 // DropdownMenuItem<String>(
//                 //   value: audit.plantName.toString().split('.').last,
//                 //   child: Text(audit.plantName.toString().split('.').last),
//                 // ),
//               ],
//               onChanged: (String? newValue) {
//                 // Handle dropdown value changes
//               },
//             ),
//             verticalSpaceMedium,
//             DropdownButtonFormField<String>(
//               value: null,
//               decoration: InputDecoration(
//                 labelText: 'Supplier Name',
//                 filled: true,
//                 contentPadding: const EdgeInsets.symmetric(horizontal: 10),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//               ),
//               items: [
//                 // DropdownMenuItem<String>(
//                 //   value: audit.supplierName.toString().split('.').last,
//                 //   child: Text(audit.supplierName.toString().split('.').last),
//                 // ),
//               ],
//               onChanged: (String? newValue) {
//                 // Handle dropdown value changes
//               },
//             ),
//             verticalSpaceMedium,
//             DropdownButtonFormField<String>(
//               value: null,
//               decoration: InputDecoration(
//                 labelText: 'Audit Type Name',
//                 filled: true,
//                 contentPadding: const EdgeInsets.symmetric(horizontal: 10),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//               ),
//               items: [
//                 DropdownMenuItem<String>(
//                   value: audit.auditTypeName.toString().split('.').last,
//                   child: Text(audit.auditTypeName.toString().split('.').last),
//                 ),
//               ],
//               onChanged: (String? newValue) {
//                 // Handle dropdown value changes
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
