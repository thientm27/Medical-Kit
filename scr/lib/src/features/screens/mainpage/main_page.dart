import 'package:flutter/material.dart';
import 'package:scr/src/constants/colors.dart';
import 'package:scr/src/constants/images.dart';
import 'package:scr/src/features/models/models_pharmacist.dart';
import 'package:scr/src/features/screens/mainpage/pharmacist.dart';
import 'package:scr/src/features/screens/disease/popular_disease.dart';
import 'package:ionicons/ionicons.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                    padding:const EdgeInsets.all(8.0), 
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      const Image(
                          image: AssetImage(userImage),
                          height: 50,
                        ),
                      const Column(
                          mainAxisAlignment: MainAxisAlignment.center, 
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[ 
                            Text(
                            'Hello there,',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),  
                            Text(
                            'Do Thanh Bo',
                            style: TextStyle(
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
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PopularDisease()));
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
                          name: 'Pharmacist1',      // Replace with the actual name
                          room: '1',      // Replace with the actual room
                        ),
                      ),
                      Pharmacist(
                        pharmacistModel: PharmacistModel(
                          image: pharmacist2, // Replace with the actual image path
                          name: 'Pharmacist2',      // Replace with the actual name
                          room: '2',      // Replace with the actual room
                        ),
                      ),
                      Pharmacist(
                        pharmacistModel: PharmacistModel(
                          image: pharmacist3, // Replace with the actual image path
                          name: 'Pharmacist3',      // Replace with the actual name
                          room: '3',      // Replace with the actual room
                        ),
                      ),
                      Pharmacist(
                        pharmacistModel: PharmacistModel(
                          image: pharmacist4, // Replace with the actual image path
                          name: 'Pharmacist4',      // Replace with the actual name
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
                         SizedBox(
                          width: 160, // Set the width for the first button
                          height: 100,
                          child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            backgroundColor: Colors.white,
                            side:const BorderSide(
                              color: tRedColor, // Replace with your desired border color
                              width: 2.0, // Replace with your desired border width
                              ),
                          ),
                          child:const Text(
                            'Medical tips',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              ),                         
                            ),
                        ),
                        ),
                        const SizedBox(width: 20), // Add some spacing between the buttons
                         SizedBox(
                          width: 160, // Set the width for the first button
                          height: 100,
                          child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            backgroundColor: Colors.white,
                            side:const BorderSide(
                              color: tRedColor, // Replace with your desired border color
                              width: 2.0, // Replace with your desired border width
                              ),
                          ),
                          child:const Text(
                            'Medical Refills',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              ),                         
                            ),
                        ),
                        ),
                        ],
                      ),
                      const SizedBox(height: 25.0), 
                      Row(
                      mainAxisAlignment: MainAxisAlignment.center, 
                      children: [
                         SizedBox(
                          width: 160, // Set the width for the first button
                          height: 100,
                          child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            backgroundColor: Colors.white,
                            side:const BorderSide(
                              color: tRedColor, 
                              width: 2.0, 
                              ),
                          ),
                          child:const Text(
                            'Using history',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              ),                         
                            ),
                        ),
                        ),
                        const SizedBox(width: 20),
                        SizedBox(
                          width: 160, 
                          height: 100,
                          child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            backgroundColor: Colors.white,
                            side:const BorderSide(
                              color: tRedColor, 
                              width: 2.0, 
                              ),
                          ),
                          child:const Text(
                            'Diseases news',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              ),                         
                            ),
                        ),
                        ),
                        ],
                      )
                  ]
                  )     
                ));
  }
}
