import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:scr/src/constants/colors.dart';
import 'package:scr/src/constants/images.dart';
import 'package:scr/src/constants/texts.dart';
import 'package:scr/src/features/models/models_on_boarding.dart';
import 'package:scr/src/features/screens/on_boarding_page_widget.dart';
import 'package:scr/src/features/screens/login/pre_use_screen.dart';

class OnBoardingScreen extends StatelessWidget{
  const OnBoardingScreen({Key? key,
  }) : super (key:key);

  @override
  Widget build(BuildContext context){
    final size = MediaQuery.of(context).size;
    final pages = [
      OnBoardingPageWidget(
        model: OnBoardingModel(
        logo: logo,
        image: splash1,
        title: mainTitle,
        subTitle: subTitle1,
        counterText: counter1,
        height: size.height,
        bgColor: tOnBoardingPage1Color,
      )),

      OnBoardingPageWidget(
        model: OnBoardingModel(
        logo: logo,
        image: splash2,
        title: mainTitle,
        subTitle: subTitle2,
        counterText: counter2,
        height: size.height,
        bgColor: tOnBoardingPage2Color,
      )),

      OnBoardingPageWidget(
        model: OnBoardingModel(
        logo: logo,
        image: splash3,
        title: mainTitle,
        subTitle: subTitle3,
        counterText: counter3,
        height: size.height,
        bgColor: tOnBoardingPage3Color,
      )),

      OnBoardingPageWidget(
        model: OnBoardingModel(
        logo: logo,
        image: splash4,
        title: mainTitle,
        subTitle: subTitle4,
        counterText: counter4,
        height: size.height,
        bgColor: tOnBoardingPage4Color,
      )),
    ];
    return Scaffold(
      body:Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: pages,
              ),
              Positioned(
                bottom: 0.0,
                child: OutlinedButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const PreUse()));
                  },
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(color: Colors.black26),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Color(0xffcb172f), shape: BoxShape.circle),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: tOnBoardingPage1Color,
                      ),
                    ),
                  ),
                )
              ],
          )
      );
  }
}