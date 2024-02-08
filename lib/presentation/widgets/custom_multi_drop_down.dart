import 'package:audit_task/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomMultiselectDropDown extends StatefulWidget {
  final Function(List<String>) selectedList;
  final List<String> listOFStrings;

  CustomMultiselectDropDown(
      {required this.selectedList, required this.listOFStrings});

  @override
  createState() {
    return _CustomMultiselectDropDownState();
  }
}

class _CustomMultiselectDropDownState extends State<CustomMultiselectDropDown> {
  List<String> listOFSelectedItem = [];
  String selectedText = "";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      decoration:
          BoxDecoration(border: Border.all(color: AppColors.primaryGreen)),
      child: ExpansionTile(
        iconColor: AppColors.primaryGreen,
        title: Text(
          "Audit number",
        ),
        children: <Widget>[
          new ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.listOFStrings.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.only(bottom: 8.0),
                child: _ViewItem(
                    item: widget.listOFStrings[index],
                    selected: (val) {
                      selectedText = val;
                      if (listOFSelectedItem.contains(val)) {
                        listOFSelectedItem.remove(val);
                      } else {
                        listOFSelectedItem.add(val);
                      }
                      widget.selectedList(listOFSelectedItem);
                      setState(() {});
                    },
                    itemSelected: listOFSelectedItem
                        .contains(widget.listOFStrings[index])),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ViewItem extends StatelessWidget {
  String item;
  bool itemSelected;
  final Function(String) selected;

  _ViewItem(
      {required this.item, required this.itemSelected, required this.selected});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding:
          EdgeInsets.only(left: size.width * .032, right: size.width * .098),
      child: Row(
        children: [
          SizedBox(
            height: 24.0,
            width: 24.0,
            child: Checkbox(
              value: itemSelected,
              onChanged: (val) {
                selected(item);
              },
              activeColor: Colors.blue,
            ),
          ),
          SizedBox(
            width: size.width * .025,
          ),
          Text(
            item,
          ),
        ],
      ),
    );
  }
}
