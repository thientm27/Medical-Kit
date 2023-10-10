import 'package:flutter/material.dart';
import 'package:scr/src/features/models/model_tips.dart';
import 'package:scr/src/constants/colors.dart';
class TipsScreen extends StatelessWidget {
  const TipsScreen({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tOnBoardingPage1Color,
      appBar: AppBar(
        title:const Text('Tips'),
      ),
      body: ListView.builder(itemCount: tipsList.length, itemBuilder: (context, index){
        Tips tips = tipsList[index];
        return Card(
          child: ListTile(
            title: Text(tips.title),
            trailing:  const Icon(Icons.thumb_up_outlined),
          )
        );      
      },
    )
    );
  }
}