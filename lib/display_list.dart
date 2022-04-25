import 'package:application/head_text.dart';
import 'package:application/provider/user_name.dart';
import 'package:flutter/material.dart';
import './provider/name.dart';
import 'package:provider/provider.dart';
class DisplayList extends StatelessWidget {
  //const DisplayList({ Key? key }) : super(key: key);
  List<Name> names;
  DisplayList({@required this.names});

  @override
  Widget build(BuildContext context) {
    List<Name> checkName = [];
    for (int i = 0; i < names.length; i++)
      if (names[i].check == true) 
       checkName.add(names[i]);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 3, bottom: 3),
          width: 170,
          height: 35,
          color: Color(0XFF455F74),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HeadText(
                text: checkName[0].name,
              ),
              SizedBox(width: 20),
              GestureDetector(
                  onTap: () {
                   Provider.of<UserName>(context,listen: false).sendName(checkName[0]);
                  },
                  child: HeadText(
                text: "X",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
            ],
          ),
        ),
        SizedBox(width: 10),
        if (checkName.length - 1 > 0) ...[
          Container(
            padding: EdgeInsets.all(3),
            width: 30,
            height: 30,
            color: Color(0XFF455F74),
            child: HeadText(
              text: (checkName.length - 1).toString() + "+",
            ),
          )
        ]
      ],
    );
  }
}
