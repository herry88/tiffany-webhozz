import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: "ItemCode ",
                    labelText: "ItemCode",
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "ItemName ",
                    labelText: "ItemName",
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Price ",
                    labelText: "Price",
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Stock ",
                    labelText: "Stock",
                  ),
                ),
                ElevatedButton(
                  child: Text('Edit'),
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
