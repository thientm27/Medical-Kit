import 'package:flutter/material.dart';
import 'package:scr/src/features/models/model_medicine.dart';
import 'package:scr/src/constants/colors.dart';
import 'package:scr/src/features/controllers/medicine_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:scr/src/features/screens/medicines/using_medicines_page.dart';
class MyBox extends StatefulWidget {
  const MyBox({Key? key}) : super(key: key);
 @override
  _MyBoxState createState() => _MyBoxState();
}

class _MyBoxState extends State<MyBox>{
  List<Medicine> medicines = [];
  
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
      var sharedPref =await SharedPreferences.getInstance();
      String id = sharedPref.getString('productId')!;
      List<Medicine> fetchedMedcines = await getMyBoxMedicines(id);
      setState(() {
        medicines = fetchedMedcines;
      });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text(
          'My Family Box',
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 18,
              fontWeight: FontWeight.bold),
          )
      ),
      body:Container(
        color: tOnBoardingPage1Color,
        child: ListView.builder(
        itemCount: medicines.length,
        itemBuilder: (context, index) {
        Medicine medicine = medicines[index];
        return Card(
          child: ListTile(
            title: Text(medicine.name),
            subtitle: Text(medicine.notes),
            trailing:  const Icon(Icons.add_circle_outline),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => UsingMedicinesPage(medicines: medicine)));
            },
          ),
        );
        }
    )
    )
    );
  }
}