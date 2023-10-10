import 'package:flutter/material.dart';
import 'package:scr/src/features/models/model_news.dart';
import 'package:scr/src/constants/colors.dart';
class NewsPage extends StatelessWidget {

  final News news;

  const NewsPage(
    {Key? key,
    required this.news,
    }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tOnBoardingPage1Color,
      appBar: AppBar(
        title: Text(
          news.title,
          style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold
                ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20.0),
            Center(
            child: Image(
              image: AssetImage(news.image),
              height: 200.0,
            ),
            ),   
            Center(
            child: Text(
              news.date,
              style: const TextStyle(
                fontSize: 16
                ),
            ),
            ),
            const SizedBox(height: 50.0),
            Center(
            child: Text(
              news.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                ),
            ),
            ),
            Text(
              news.detail,
              style: const TextStyle(fontSize: 16),
            ),
      ])
      )
    );
  }
}