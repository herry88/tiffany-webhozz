import 'package:flutter/material.dart';

class PageKedua extends StatefulWidget {
  const PageKedua({Key? key}) : super(key: key);

  @override
  _PageKeduaState createState() => _PageKeduaState();
}

class _PageKeduaState extends State<PageKedua> {
  String _value = 'Hello Flutter';

  //function disini
  void tekanSaya() {
    setState(() {
      _value = 'Nama Kamu';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Page Kedua'),
      ),
      body: Container(
        padding: const EdgeInsets.all(
          32.0,
        ),
        child: Column(
          children: [
            Text(
              _value,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              onPressed: () {
                //functionnya taruh sini
                tekanSaya();
              },
              child: const Text('Button'),
            ),
            Row(
              children: [
                Icon(
                  Icons.ac_unit,
                ),
                Icon(Icons.access_alarm_sharp),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
