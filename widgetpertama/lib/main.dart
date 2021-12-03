import 'package:flutter/material.dart';
import 'package:widgetpertama/page_kedua.dart';
import 'package:widgetpertama/page_ketiga.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyContainer(),
    );
  }
}

class MyContainer extends StatelessWidget {
  const MyContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PageKedua(),
                  ),
                );
              },
              child: const Text('Button Pertama'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PageKetiga(),
                  ),
                );
              },
              child: Text('Layouts'),
            ),
            Text('Ini adalah text'),
          ],
        ),
      ),
    );
  }
}
