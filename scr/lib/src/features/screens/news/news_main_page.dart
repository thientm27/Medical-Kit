import 'package:flutter/material.dart';
import 'package:scr/src/features/models/model_news.dart';
import 'package:scr/src/features/screens/news/news_page.dart';
import 'package:scr/src/constants/colors.dart';
class NewsMainPage extends StatelessWidget {
  const NewsMainPage({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tOnBoardingPage1Color,
      appBar: AppBar(
        title:const Text('News'),
      ),
      body: ListView.builder(itemCount: newsList.length, itemBuilder: (context, index){
        News news = newsList[index];
        return Card(
          child: ListTile(
            title: Text(news.title),
            subtitle: Text(news.date),
            leading: Image(image: AssetImage(news.image), height: 80,width: 80,),
            trailing:  const Icon(Icons.arrow_forward_rounded),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => NewsPage(news: news)));
            },
          )
        );      
      },
    )
    );
  }
}