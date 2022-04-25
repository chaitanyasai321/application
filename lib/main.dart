import 'package:application/home_page.dart';
import 'package:application/provider/user_name.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(context) => UserName(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}