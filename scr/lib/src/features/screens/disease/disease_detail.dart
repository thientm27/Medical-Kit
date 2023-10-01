import 'package:flutter/material.dart';
import 'package:scr/src/features/models/model_disease.dart';
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
        title: Text(disease.name),
      ),
      body: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text(
              'Description: ${disease.description}',
              style: const TextStyle(fontSize: 16),
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
      ])
    );
  }
}