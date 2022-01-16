import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/constanta.dart';
import 'package:todo_list/database/database.dart';
import 'package:todo_list/model/notelist.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Note>> _noteList;
  final DateFormat _dateFormat = DateFormat("MM, dd, yyyy");
  DataBaseHelper dataBaseHelper = DataBaseHelper.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: fg_color,
      ),
      body: FutureBuilder(
        future: _noteList,
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(itemBuilder: (context, index){

          });
        },
      ),
    );
  }
}
