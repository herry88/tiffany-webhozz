import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/constanta.dart';
import 'package:todo_list/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: DoubleBackToCloseApp(
          snackBar: const SnackBar(
            content: Text(
              'Tap Back Again to Exit',
            ),
          ),
          child: Home(),
        ),
      ),
      theme: ThemeData(
        scaffoldBackgroundColor: bg_color,
        primaryColor: fg_color,
        primarySwatch: Colors.indigo,
      ),
    );
  }
}
