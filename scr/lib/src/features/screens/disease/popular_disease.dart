import 'package:flutter/material.dart';
import 'package:scr/src/features/models/model_disease.dart';
import 'package:scr/src/constants/colors.dart';
import 'package:scr/src/features/screens/disease/disease_detail.dart';
class PopularDisease extends StatelessWidget {
  PopularDisease({Key? key}) : super(key: key);


final List<Disease> diseases = [
  Disease(
    id: '1',
    name: "Influenza",
    description: "Influenza is a viral infection...",
    symptoms: "Fever, cough, body aches...",
    prevalence: "Common",
    riskFactors: "Exposure to infected individuals...",
    treatment: "Antiviral medications...",
    prognosis: "Most people recover within a week...",
  ),
  Disease(
    id: '2',
    name: "COVID-19",
    description: "COVID-19 is a highly contagious respiratory illness...",
    symptoms: "Fever, cough, shortness of breath...",
    prevalence: "Pandemic",
    riskFactors: "Exposure to infected individuals, comorbidities...",
    treatment: "Supportive care, vaccines...",
    prognosis: "Varies depending on severity...",
  ),
  // Add more diseases as needed
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Popular diseases')
      ),
      body:Container(
        color: tOnBoardingPage1Color,
        child: ListView.builder(
        itemCount: diseases.length,
        itemBuilder: (context, index) {
        final item = diseases[index];
        return ListTile(
          title: Text(
            item.name,
            style:const TextStyle(
              color: Colors.black,
              fontFamily: 'Montserrat',
              fontSize: 18,
              fontWeight: FontWeight.bold),
            ),
            trailing:const Icon(Icons.arrow_forward_ios_rounded),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DiseaseDetail(disease: diseases[index]))
                  );
            }
              );
            },
        )
    )
    );
  }
}