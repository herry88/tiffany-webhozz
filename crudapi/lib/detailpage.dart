import 'package:crudapi/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'editpage.dart';

class DetailPage extends StatefulWidget {
  List? list;
  int index;
  DetailPage({Key? key, this.list, required this.index}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  //function delete
  void deleteData() async {
    await http.post(
        Uri.parse(
          "https://herryprasetyo.my.id/latihan/deletedata.php",
        ),
        body: {
          'id': widget.list![widget.index]['id'].toString(),
        });
  }

  //function confirmation delete data
  void confirm() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            'Apakah anda yakin untuk delete ? ${widget.list![widget.index]['item_name']}',
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                //delete function
                deleteData();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Dashboard(),
                  ),
                );
              },
              child: const Icon(Icons.check_circle),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                //non redirect
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.cancel,
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
            ),
          ],
        );
      },
    );
  }

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
        height: 200.0,
        child: Card(
          elevation: 5.0,
          margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
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
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => EditPage(
                              list: widget.list,
                              index: widget.index,
                            ),
                          ),
                        );
                      },
                      child: Text('Edit Data'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.greenAccent,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        //function delete
                        confirm();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                      child: const Text('Delete'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
