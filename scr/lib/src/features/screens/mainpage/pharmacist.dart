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
            color: Colors.transparent,
            child: Material(
            elevation: 10, 
            shape:const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0), // Adjust horizontal radius
                topRight: Radius.circular(15.0), // Adjust horizontal radius
                bottomLeft: Radius.circular(15.0), // Adjust horizontal radius
                bottomRight: Radius.circular(15.0), // Adjust horizontal radius
              ),
            ),
            clipBehavior: Clip.antiAlias, 
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
    )
     ) );
      
  }
}