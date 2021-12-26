import 'dart:async';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String? postUrl;
  ArticleView({Key? key, this.postUrl}) : super(key: key);

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
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
            ),
          )
        ],
      ),
    );
  }
}
