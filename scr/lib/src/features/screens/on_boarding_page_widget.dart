import 'package:flutter/material.dart';
import 'package:scr/src/constants/sizes.dart';
import 'package:scr/src/features/models/models_on_boarding.dart';

class OnBoardingPageWidget extends StatelessWidget{
  const OnBoardingPageWidget({
    Key? key,
    required this.model,
  }): super (key: key);

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(tDefaultSize),
      color: model.bgColor,
      child: Column(
        children: [
          Image(
            image: AssetImage(model.logo,),
            height: model.height * 0.25,
          ),
          Column(
            children: [
               Text(
                model.title,
                style:const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                  ),
                textAlign: TextAlign.center,
                ),
            const SizedBox(height: 80.0,),
            Image(image: AssetImage(model.image), height: model.height * 0.35),
            Text(
              model.subTitle,
              style:const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                  ),
                textAlign: TextAlign.center,),
            Text(
              model.counterText,
              style:const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                  ),
                textAlign: TextAlign.center,),
            const SizedBox(height: 50.0,)
              ],            
            ),
          ],
        )    
      );
  }
}