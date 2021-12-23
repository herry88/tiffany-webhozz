import 'dart:convert';

import 'package:appnews/models/article_model.dart';
import 'package:appnews/secret.dart';
import 'package:http/http.dart' as http;

class News {
  //deklarasi listnya == array
  List<ArticleModel> news = [];

  //function getNews
  Future<void> getNews() async {
    //baseUrl newsapiorg
    String url =
        "https://newsapi.org/v2/top-headlines?country=id&apiKey=${apiKey}";
    var response = await http.get(
      Uri.parse(url),
    );
    var jsonData = jsonDecode(response.body);

    //perumpamaan untuk menampilkan datanya
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach(
        (databerita) {
          if (databerita['urlToImage'] != null &&
              databerita['description'] != null) {
            ArticleModel article = ArticleModel(
              title: databerita['title'],
              author: databerita['author'],
              description: databerita['description'],
              urlToImage: databerita['urlToImage'],
              publishedAt: DateTime.parse(databerita['publishedAt']),
              articleUrl: databerita['url'],
            );
            news.add(article);
          }
        },
      );
    }
  }
}
