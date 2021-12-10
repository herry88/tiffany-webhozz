import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'adddata.dart';
import 'detailpage.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  //buat function get data
  Future<List>? getData() async {
    final response = await http.get(
      Uri.parse(
        "https://herryprasetyo.my.id/latihan/get_data.php",
      ),
    );
    // print(response.body);
    return json.decode(response.body);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('my store'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //untuk redirect ke page addData
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddData(),
            ),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ItemList(list: snapshot.data)
              : const Center(
                  child: Text('Gagal tampil'),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  List? list;
  ItemList({Key? key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list == null ? 0 : list!.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailPage(list:list, index:index),
                ),
              );
            },
            child: Card(
              child: ListTile(
                title: Text(list![index]['item_name']),
                leading: const Icon(
                  Icons.widgets,
                ),
                subtitle: Text("Stock :${list![index]['stock']}"),
              ),
            ),
          );
        });
  }
}
