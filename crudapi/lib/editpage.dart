import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditPage extends StatefulWidget {
  List? list;
  int index;
  EditPage({this.list, required this.index});

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  //deklarasi form
  TextEditingController controllerCode = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerPrice = TextEditingController();
  TextEditingController controllerStock = TextEditingController();

  void editData() {
    var url = "https://herryprasetyo.my.id/latihan/editdata.php";
    http.post(Uri.parse(url), body: {
      "id": widget.list![widget.index]['id'],
      "itemcode": controllerCode.text,
      "itemname": controllerName.text,
      "price": controllerPrice.text,
      "stock": controllerStock.text
    });
  }

  //ambil data
  @override
  void initState() {
    controllerCode =
        TextEditingController(text: widget.list![widget.index]['item_code']);
    controllerName = TextEditingController(
      text: widget.list![widget.index]['item_name'],
    );
    controllerPrice =
        TextEditingController(text: widget.list![widget.index]['price']);
    controllerStock =
        TextEditingController(text: widget.list![widget.index]['stock']);
    super.initState();
  }

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
                  controller: controllerCode,
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
                  onPressed: () {
                    editData();
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
