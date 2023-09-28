import 'dart:ui';

class OnBoardingModel{
  final String logo;
  final String title;
  final String image;
  final String subTitle;
  final String counterText;
  final Color bgColor;
  final double height;

  OnBoardingModel({
    required this.logo,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.counterText,
    required this.bgColor,
    required this.height
  });
}