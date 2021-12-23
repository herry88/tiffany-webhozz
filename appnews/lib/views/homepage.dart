import 'package:appnews/helper/data.dart';
import 'package:appnews/helper/news.dart';
import 'package:appnews/helper/widgets.dart';
import 'package:appnews/models/article_model.dart';
import 'package:appnews/models/category_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool _loading;
  //data category
  List<CategoryModel> categories = <CategoryModel>[];
  //data news
  List<ArticleModel> newsList = <ArticleModel>[];

  //get function news
  void getNews() async {
    News news = News();
    await news.getNews();
    newsList = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    categories = getCategories();
    getNews();
    setState(() {
      _loading = true;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Flutter',
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'News',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: _loading
            ? const Center(
                child: Text('Data Loading...'),
              )
            : SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        height: 70.0,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return CategoryCard(
                              imageAssetUrl: categories[index].imageasseturl,
                              categoryName: categories[index].categoryname,
                            );
                          },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 16.0,
                        ),
                        child: ListView.builder(
                          itemCount: newsList.length,
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return NewsTile(
                              imgUrl: newsList[index].urlToImage.toString(),
                              title: newsList[index].title.toString(),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final imageAssetUrl, categoryName;
  const CategoryCard({Key? key, this.imageAssetUrl, this.categoryName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(
          right: 14.0,
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: CachedNetworkImage(
                imageUrl: imageAssetUrl,
                height: 60,
                width: 120.0,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 60.0,
              width: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.black26,
              ),
              child: Text(
                categoryName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
