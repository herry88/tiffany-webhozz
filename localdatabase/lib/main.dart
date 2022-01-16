import 'package:flutter/material.dart';
import 'package:localdatabase/ui/shopping_list_dialog.dart';
import 'package:localdatabase/utils/dbhelper.dart';
import 'models/shopping_list.dart';
import 'models/list_items.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Shlist(),
    );
  }
}

class Shlist extends StatefulWidget {
  const Shlist({Key? key}) : super(key: key);

  @override
  _ShlistState createState() => _ShlistState();
}

class _ShlistState extends State<Shlist> {
  List<ShoppingList> shoppingList;
  DbHelper helper = DbHelper();

  ShoppingListDialog dialog;

  @override
  void initState() {
    dialog = ShoppingListDialog();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
      ),
      body: ListView.builder(
        itemCount: (shoppingList != null) ? shoppingList.length : 0,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(shoppingList[index].name),
            onDismissed: (direction) {
              //function delete
              String strName = shoppingList[index].name;
              helper.deleteList(shoppingList[index]);
              setState(() {
                shoppingList.removeAt(index);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('$strName deleted'),
                ),
              );
            },
            child: ListTile(title: Text(shoppingList[index].name)),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => dialog.buildDialog(
              context,
              ShoppingList(0, '', 0),
              true,
            ),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
