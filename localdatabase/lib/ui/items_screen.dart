import 'package:flutter/material.dart';
import 'package:localdatabase/models/list_items.dart';
import 'package:localdatabase/models/shopping_list.dart';
import 'package:localdatabase/utils/dbhelper.dart';

class ItemScreen extends StatefulWidget {
  final ShoppingList? shoppingList;
  ItemScreen({Key? key, this.shoppingList}) : super(key: key);

  @override
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  DbHelper? helper;
  List<ListItems>? items;
  final ShoppingList? shoppingList;
  _ItemScreenState(this.shoppingList);
  @override
  Widget build(BuildContext context) {
    // helper = DbHelper();
    // showData(this.shoppingList!.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(shoppingList!.name),
      ),
      body: Container(
        height: 300.0,
        child: items!.isEmpty
            ? Column(
                children: [
                  Text('Tidak Dapat Ambil Data'),
                ],
              )
            : ListView.builder(
                itemCount: items!.length,
                itemBuilder: (context, index) {
                  return ListTile();
                },
              ),
      ),
    );
  }

  Future showData(int idList) async {
    await helper!.openDb();
    items = await helper!.getItems(idList);
    setState(() {
      items = items;
    });
  }
}
