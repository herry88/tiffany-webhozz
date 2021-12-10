import 'package:crudapi/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddData extends StatefulWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  //deklarasikan form dulu
  TextEditingController _controllerCode = TextEditingController();
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerPrice = TextEditingController();
  TextEditingController _controllerStock = TextEditingController();

  //function add data
  void addData() {
    var url = "https://herryprasetyo.my.id/latihan/adddata.php";
    http.post(Uri.parse(url), body: {
      "item_code": _controllerCode,
      "item_name": _controllerName,
      "price": _controllerPrice,
      "stock": _controllerStock,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          10.0,
        ),
        child: ListView(
          children: [
            Column(
              children: [
                TextField(
                  controller: _controllerCode,
                  decoration: InputDecoration(
                    hintText: "Item Code",
                    labelText: "Item Code",
                  ),
                ),
                TextField(
                  controller: _controllerName,
                  decoration: InputDecoration(
                    hintText: "Item namae",
                    labelText: "Item name",
                  ),
                ),
                TextField(
                  controller: _controllerPrice,
                  decoration: InputDecoration(
                    hintText: "Price",
                    labelText: "Price",
                  ),
                ),
                TextField(
                  controller: _controllerStock,
                  decoration: InputDecoration(
                    hintText: "Stock",
                    labelText: "Stock",
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    //addData(),
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Dashboard(),
                      ),
                    );
                  },
                  child: Text('Save'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
