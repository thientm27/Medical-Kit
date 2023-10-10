import 'package:flutter/material.dart';
import 'package:scr/src/constants/colors.dart';
import 'package:scr/src/constants/images.dart';
import 'package:scr/src/features/models/models_pharmacist.dart';
import 'package:scr/src/features/screens/mainpage/box.dart';
import 'package:scr/src/features/screens/mainpage/pharmacist.dart';
import 'package:scr/src/features/screens/medicines/mybox.dart';
import 'package:scr/src/features/screens/news/news_main_page.dart';
import 'package:scr/src/features/screens/disease/popular_disease.dart';
import 'package:ionicons/ionicons.dart';
import 'package:scr/src/features/screens/tips/tips.dart';
import 'package:scr/src/features/screens/usingHistory/using_history_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  String userName = "";
   @override
  void initState() {
    super.initState();
    getLoginUser();
  }

  Future<void> getLoginUser() async {
      var sharedPref = await SharedPreferences.getInstance();
      String name = sharedPref.getString('userName')!;
      setState(() {
        userName = name;
      });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: tOnBoardingPage1Color,
        body: Padding(
                padding:const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                   SizedBox(
                    height: 80,        
                    child: Padding(
                    padding:const EdgeInsets.all(0.0), 
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      IconButton(
                          onPressed: () {},
                          icon:const Icon(
                          Ionicons.menu_outline,
                          color: Colors.black,
                          ),
                        ),
                       Column(
                          mainAxisAlignment: MainAxisAlignment.center, 
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[ 
                            const Text(
                            'Hello there,',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),  
                            Text(
                            userName,
                            style:const TextStyle(
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                          ),  
                        ]),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon:const Icon(
                          Ionicons.notifications,
                          color: Colors.black,
                          ),
                        ),
                      ]),   
                  ),
                  ),

                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PopularDisease()));
                  },
                  child: Container(
                    height: 100,        
                    decoration: BoxDecoration(
                      border: Border.all(
                      color: tRedColor, 
                      width: 3.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0), 
                      color: Colors.white,
                    ),
                    child: const Padding(
                    padding:  EdgeInsets.all(8.0), 
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center, 
                          children:[ 
                            Text(
                            'Popular disease',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),  
                            Text(
                            'Easy, convenient and quick!',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                              fontSize: 15),
                          ),  
                        ]), 
                        Image(
                          image: AssetImage(logo),
                          height: 50,
                        )
                      ]),   
                  ),
                  ),
                ),
                  const SizedBox(height: 25.0), 
                  SingleChildScrollView(
                     scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                      Pharmacist(
                        pharmacistModel: PharmacistModel(
                          image: pharmacist1, // Replace with the actual image path
                          name: 'Daniel Miller',      // Replace with the actual name
                          room: '1',      // Replace with the actual room
                        ),
                      ),
                      const SizedBox(width: 20.0), 
                      Pharmacist(
                        pharmacistModel: PharmacistModel(
                          image: pharmacist2, // Replace with the actual image path
                          name: 'Christopher Anderson',      // Replace with the actual name
                          room: '2',      // Replace with the actual room
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      Pharmacist(
                        pharmacistModel: PharmacistModel(
                          image: pharmacist3, // Replace with the actual image path
                          name: 'Samuel Jackson',      // Replace with the actual name
                          room: '3',      // Replace with the actual room
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      Pharmacist(
                        pharmacistModel: PharmacistModel(
                          image: pharmacist4, // Replace with the actual image path
                          name: 'Sophia Patel',      // Replace with the actual name
                          room: '4',      // Replace with the actual room
                        ),
                      ),
                      ],
                      )
                    ),
                    const SizedBox(height: 25.0), 
                     Row(
                     mainAxisAlignment: MainAxisAlignment.center, // Align buttons to the center horizontally
                      children: [
                        Box(titleString: 'Medical tips', onPressedCallback: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TipsScreen()));
                        }),
                        const SizedBox(width: 20.0), 
                        Box(titleString: 'Using History', onPressedCallback: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const UsingHistoryPage()));
                        },),
                        ],
                      ),
                      const SizedBox(height: 25.0), 
                      Row(
                      mainAxisAlignment: MainAxisAlignment.center, 
                      children: [
                        Box(titleString: 'My Family Box', onPressedCallback: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MyBox()
                          )
                          );},),
                        const SizedBox(width: 20),
                        Box(titleString: 'News', onPressedCallback: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NewsMainPage()
                          )
                          );
                          },
                          ),
                        ],
                      )
                  ]
                  )     
                ));
  }
}
