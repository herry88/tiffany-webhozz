import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lastproject/model/postmodel.dart';
import 'package:lastproject/services/postdata.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PostService _postService = PostService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fetch Data Post',
        ),
      ),
      body: FutureBuilder<List<PostModel>>(
        future: _postService.fetchPost(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 5.0,
                    ),
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Color(0xff97fff),
                      borderRadius: BorderRadius.circular(
                        15.0,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data![index].title.toString(),
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Text('Data Tidak Ada'),
            );
          }
        },
      ),
    );
  }
}
