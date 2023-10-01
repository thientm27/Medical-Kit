import 'package:flutter/material.dart';
import 'package:scr/src/features/models/models_pharmacist.dart';
import 'package:scr/src/features/screens/call.dart';
class Pharmacist extends StatelessWidget {

  final PharmacistModel pharmacistModel;

  const Pharmacist({
    Key? key,
    required this.pharmacistModel,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CallPage(callID : pharmacistModel.room)));
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
            color: Colors.red, // Set the border color here
            width: 5.0,         // Set the border width here
          ),
          borderRadius: BorderRadius.circular(10.0), // Optional: Add rounded corners
      ),
        child: Container(
            color: Colors.white,
                  child: Column(
                    children: [            
                      Image(
                        image: AssetImage(pharmacistModel.image), 
                        height: 200,
                      ),
                      const SizedBox(height: 10), 
                      Text(
                        pharmacistModel.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      ],
                    )
    )));
  }
}