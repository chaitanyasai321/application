import 'package:application/head_text.dart';
import 'package:application/provider/name.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './provider/user_name.dart';
class SelectList extends StatefulWidget {
  @override
  String name;
  SelectList({ @required this.name});
  State<SelectList> createState() => _SelectListState();

}

class _SelectListState extends State<SelectList> {
//  const SelectList({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {

    List<Name> names= Provider.of<UserName>(context).names;
    return SingleChildScrollView(
      child: Column(
        children: [
          HeadText(
            text: widget.name,
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 350,
            height: 50,
            child: TextField(
              style: TextStyle(
                //fontSize: 40.0,
                height: 2.0,
                color: Colors.white,
              ),
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(color: Colors.white54),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white54,
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white12),
                    borderRadius: BorderRadius.circular(70)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(70)),
                fillColor: Colors.white,
                hoverColor: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FlatButton(
                onPressed: () {
                  Provider.of<UserName>(context,listen: false).checks(1);
                },
                child: HeadText(
                  text: "Select All",
                  color: Color(0XFF7CA88A),
                  fontWeight: FontWeight.w600,
                ),
              ),
              FlatButton(
                onPressed: () {
                  Provider.of<UserName>(context,listen: false).checks(0);
                },
                child: HeadText(
                  text: "Clear All",
                  color: Color(0XFF7CA88A),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          SingleChildScrollView(
            child: Container(
              height: 200,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: names.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Container(
                      width: 14,
                      height: 14,
                      color: Colors.white,
                      child: Checkbox(
                        value: names[index].check,
                        onChanged: (_) {
                          Provider.of<UserName>(context,listen: false).checkOption(index);
                        },
                        checkColor: Colors.white,
                        activeColor: Color(0XFF7CA88A),
                        hoverColor: Colors.white,
                      ),
                    ),
                    title: HeadText(text: names[index].name),
                    minVerticalPadding: 2,
                  );
                },
              ),
            ),
          ),
          SizedBox(height:40),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancel"),
                  style: OutlinedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      side: BorderSide(
                         color: Colors.white, 
                         width: 1
                      )
                  ),
                ),
              ),
              SizedBox(width:10),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text("Reset"),
                  style: OutlinedButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor:Color(0XFF7CA88A),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      side: BorderSide(
                         color: Color(0XFF7CA88A), 
                         width: 1
                      )
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
