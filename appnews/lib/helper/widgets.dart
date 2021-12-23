import 'package:flutter/material.dart';

class NewsTile extends StatelessWidget {
  final String? imgUrl, title, desc, content, postUrl;
  NewsTile({
    Key? key,
    this.imgUrl,
    this.title,
    this.desc,
    this.content,
    this.postUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //detail article
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ArticleView(),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 24.0,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(6.0),
              bottomLeft: Radius.circular(6.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6.0),
                child: Image.network(
                  imgUrl.toString(),
                  height: 200.0,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              Text(
                title.toString(),
                style: const TextStyle(
                  fontSize: 20.0,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
