import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ArticleView extends StatefulWidget {
  final String? imgUrl, title, author;
  DateTime? publishedAt;
  ArticleView({
    Key? key,
    this.imgUrl,
    this.title,
    this.author,
    this.publishedAt,
  }) : super(key: key);

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
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
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            child: ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.5),
                  ],
                ).createShader(
                  Rect.fromLTRB(
                    0,
                    0,
                    rect.width,
                    rect.bottom,
                  ),
                );
              },
              blendMode: BlendMode.darken,
              child: CachedNetworkImage(
                imageUrl: widget.imgUrl.toString(),
                imageBuilder: (context, imageProvider) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  );
                },
                errorWidget: (context, url, error) => Image.network(
                  'https://cdn.iconscout.com/icon/free/png-256/data-not-found-1965034-1662569.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 20.0,
            right: 20.0,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40.0,
                    width: 40.0,
                    padding: const EdgeInsets.only(left: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 20.0,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.bookmark_border,
                            color: Colors.black38,
                            size: 20.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.share,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.only(
                left: 20.0,
                bottom: 50.0,
                right: 20.0,
              ),
              child: Column(
                children: [
                  Text(
                    widget.title.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    widget.author.toString(),
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.48,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(
                  20.0,
                ),
              ),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 30.0,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    widget.title.toString(),
                    style:const TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
