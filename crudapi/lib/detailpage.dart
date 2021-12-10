import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  List? list;
  int index;
  DetailPage({Key? key, this.list, required this.index}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          widget.list![widget.index]['item_name'],
        ),
      ),
      body: Container(
        child: Card(
          child: Center(
            child: Column(
              children: [
                Text(
                  widget.list![widget.index]['item_name'],
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  "Item Code:${widget.list![widget.index]['item_code']}",
                  style: const TextStyle(fontSize: 18.0),
                ),
                Text(
                  "Item Code:${widget.list![widget.index]['price']}",
                  style: const TextStyle(fontSize: 18.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  child:const Text('Delete'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
