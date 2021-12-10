import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  //buat function get data
  getData() async {
    final response = await http.get(
      Uri.parse(
        'https://herryprasetyo.my.id/latihan/get_data.php',
      ),
    );
    print(response.body);
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
        onPressed: () {},
        child: Icon(
          Icons.add,
        ),
      ),
      body: FutureBuilder(
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
    return Container();
  }
}
