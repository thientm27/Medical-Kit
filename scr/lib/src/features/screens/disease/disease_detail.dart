import 'package:flutter/material.dart';
import 'package:scr/src/features/models/model_disease.dart';
import 'package:scr/src/features/models/model_medicine.dart';
import 'package:scr/src/constants/images.dart';
import 'package:scr/src/features/screens/medicines/using_medicines_page.dart';
class DiseaseDetail extends StatelessWidget {

  final Disease disease;

  const DiseaseDetail(
    {Key? key,
    required this.disease,
    }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          disease.name,
          style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold
                ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20.0),
            const Center(
            child: Image(
              image: AssetImage(logo),
              height: 100,
            ),
            ),
            const SizedBox(height: 80.0),
            Text(
              'Description: ${disease.description}',
              style: const TextStyle(
                fontSize: 16

                ),
            ),
            const SizedBox(height: 8),
            Text(
              'Symptoms: ${disease.symptoms}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Prevalence: ${disease.prevalence}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Risk Factors: ${disease.riskFactors}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Treatment: ${disease.treatment}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Prognosis: ${disease.prognosis}',
              style: const 
              TextStyle(
                fontSize: 16
                ),
            ),
            if (disease.medicines != null && disease.medicines!.isNotEmpty)
              ListView.builder(
              shrinkWrap: true,
              itemCount: disease.medicines!.length,
              itemBuilder: (context, index) {
                Medicine medicine = disease.medicines![index];
                return Card(
                  child: ListTile(
                    title: Text(medicine.name),
                    subtitle: Text(medicine.notes),
                    // Add other widgets as needed for your Medicine object
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => UsingMedicinesPage(medicines: medicine)));
                    },
                  ),
                );
              },
            )   
          else const Center(
              child: Text("No medicines available"),
            ),
          ],
    ),
      )
      );
  }
}