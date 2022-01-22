import 'package:flutter/material.dart';
import 'package:lastproject/screen/dashboard.dart';
import 'package:lastproject/screen/postscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DashBoard(),
    );
  }
}
