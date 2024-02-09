import 'package:flutter/material.dart';

class CustomMultiselectDropDown extends StatefulWidget {
  final List<String> listOFStrings;
  List<String> listOFSelectedItem = [];

  CustomMultiselectDropDown(
      {super.key,
      required this.listOFStrings,
      required this.listOFSelectedItem});

  @override
  createState() {
    return _CustomMultiselectDropDownState();
  }
}

class _CustomMultiselectDropDownState extends State<CustomMultiselectDropDown> {
  String selectedText = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.grey)),
      child: ExpansionTile(
        iconColor: Colors.grey,
        title: const Text(
          "Audit number",
        ),
        children: <Widget>[
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.listOFStrings.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 8.0),
                child: _ViewItem(
                    item: widget.listOFStrings[index],
                    selected: (val) {
                      selectedText = val;
                      if (widget.listOFSelectedItem.contains(val)) {
                        widget.listOFSelectedItem.remove(val);
                      } else {
                        widget.listOFSelectedItem.add(val);
                      }
                      setState(() {});
                    },
                    itemSelected: widget.listOFSelectedItem
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
