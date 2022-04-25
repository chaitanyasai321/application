import 'package:flutter/material.dart';

class HeadText extends StatelessWidget {
  //const HeadText({ Key? key }) : super(key: key);

  String text;
  Color color;
  FontWeight fontWeight;
  double fontSize;
  HeadText({
    @required this.text,
    this.color = Colors.white,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 16,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
     text,
      style: TextStyle(
          color: color, fontWeight:fontWeight, fontSize:fontSize),
    );
  }
}
