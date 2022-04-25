import 'package:application/select_list.dart';
import 'package:flutter/material.dart';
import './head_text.dart';
import './provider/user_name.dart';
import './provider/name.dart';
import 'package:provider/provider.dart';
import './display_list.dart';

class DropMenu extends StatefulWidget {
  String text;
  String name;
  Color color;
  IconData icon;
  DropMenu({
    @required this.name,
    this.color = Colors.white,
    this.icon = Icons.arrow_drop_down_outlined,
    @required this.text,
  });

  @override
  State<DropMenu> createState() => _DropMenuState();
}

class _DropMenuState extends State<DropMenu> {
  @override
  Widget build(BuildContext context) {
    List<Name> names = Provider.of<UserName>(context).names;
    return Container(
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.white.withOpacity(0.5)),
        ),
        child: Padding(
            padding:
                EdgeInsets.only(left: 10, right: 30, top: 10, bottom: 10),
            child: Container(
              width: double.maxFinite,
              height: 25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (names.any((element) => element.check == true) &&
                      widget.text != "SELF_RECOVERY") ...[
                    DisplayList(
                      names: names,
                    ),
                    //HeadText(text: "Hiii")
                  ] else ...[
                    HeadText(
                      text: widget.text,
                      color: widget.color,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                  GestureDetector(
                    onTap: () {
                      return showTheList(context, widget.name);
                    },
                    child: Icon(
                      widget.icon,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  showTheList(BuildContext context, String name) {
    AlertDialog ad = AlertDialog(
      //content: const Text("Choose the type of device you want to add?"),
      backgroundColor: Color(0XFF163C56),
      content: StatefulBuilder(
        builder: (BuildContext _, StateSetter setState) {
          return Container(
            width: double.maxFinite,
            height: 500,
            child: SelectList(
              name: name,
            ),
          );
        },
      ),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ad;
      },
    );
  }
}
