import 'package:flutter/material.dart';

import '../utils/dbhelper.dart';

import '../models/shopping_list.dart';

class ShoppingListDialog {
  final txtName = TextEditingController();
  final txtPriority = TextEditingController();

  Widget buildDialog(BuildContext context, ShoppingList list, bool isNew) {
    return AlertDialog(
      title: Text(
        (isNew) ? 'New Shopping List' : 'Edit Shopping List',
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          30.0,
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: txtName,
              decoration: InputDecoration(
                hintText: 'Shopping List Name',
              ),
            ),
            TextField(
              controller: txtPriority,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Shopping List Priority (1-3)',
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Save Shopping List'),
            ),
          ],
        ),
      ),
    );
  }
}