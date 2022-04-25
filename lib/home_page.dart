import 'package:application/drop_menu.dart';
import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/material.dart';
import './head_text.dart';

class HomePage extends StatelessWidget {
  //const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFF133346),
        body: Container(
            width: double.infinity,
            height: 500,
            margin: EdgeInsets.only(left: 20, top: 50, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeadText(
                  text: "Account",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 10,
                ),
                DropMenu(text: "SELF_RECOVERY"),
                SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HeadText(
                      text: "Full Share",
                      fontWeight: FontWeight.w500,
                    ),
                    Container(
                      width: 65,
                      height: 30,
                      child: CustomSwitch(
                        value: false,
                        activeColor: Colors.green,
                        onChanged: (_) {},
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                HeadText(
                  text: "White listed users",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 10,
                ),
                DropMenu(
                  name:"White listed Users",
                  text: "Select white listed users",
                  color: Colors.white38,
                ),
                SizedBox(
                  height: 30,
                ),
                HeadText(
                  text: "Black listed users",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 10,
                ),
                DropMenu(
                  name: "Black listed users",
                  text: "Select black listed users",
                  color: Colors.white38,
                ),
              ],
            )),
      ),
    );
  }
}
