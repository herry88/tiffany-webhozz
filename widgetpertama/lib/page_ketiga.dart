import 'package:flutter/material.dart';

class PageKetiga extends StatelessWidget {
  const PageKetiga({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'img/farm-house.jpg',
            ),
            Container(
              margin: EdgeInsets.only(top: 16.0),
              child: const Text(
                'List Liburan Bandung',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.calendar_today,
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text('Open EveryDay')
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.access_time,
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        '09.00-20.00',
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.monetization_on),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text('Rp.25.000'),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Berada di jalur utama Bandung-Lembang, Farm House menjadi objek wisata yang tidak pernah sepi pengunjung. Selain karena letaknya strategis, kawasan ini juga menghadirkan nuansa wisata khas Eropa. Semua itu diterapkan dalam bentuk spot swafoto Instagramable.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            Container(
              height: 150.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(
                      4.0,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                      child: Image.network(
                          'https://media-cdn.tripadvisor.com/media/photo-s/0d/7c/59/70/farmhouse-lembang.jpg'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(
                      4.0,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                      child: Image.network(
                          'https://media-cdn.tripadvisor.com/media/photo-s/0d/7c/59/70/farmhouse-lembang.jpg'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(
                      4.0,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                      child: Image.network(
                          'https://media-cdn.tripadvisor.com/media/photo-s/0d/7c/59/70/farmhouse-lembang.jpg'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
