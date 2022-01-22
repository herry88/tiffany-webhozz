import 'package:lastproject/model/postmodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostService {
  Future<List<PostModel>> fetchPost() async {
    final response = await http.get(
      Uri.parse(
        'https://jsonplaceholder.typicode.com/posts',
      ),
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<PostModel>((json) => PostModel.fromMap(json)).toList();
    } else {
      throw Exception('Failed to Load Album');
    }
  }
}
