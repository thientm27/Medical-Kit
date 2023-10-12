import 'package:flutter/material.dart';
import 'package:scr/src/features/models/model_disease.dart';
import 'package:scr/src/features/models/model_medicine.dart';
import 'package:scr/src/features/screens/medicines/using_medicines_page.dart';

class DiseaseDetail extends StatelessWidget {
  final Disease disease;

  const DiseaseDetail({
    Key? key,
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
                fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20.0),
              if (disease.image != null)
                Center(
                  child: Image(
                    image: AssetImage(disease.image!),
                    width: 300,
                  ),
                )
              else
                const Center(
                  child: Text("No Image Available"),
                ),
              const SizedBox(height: 50.0),
              RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    const TextSpan(
                      text: 'Description: ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: disease.description,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight
                            .normal,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    const TextSpan(
                      text: 'Symptoms: ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: disease.symptoms,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight
                            .normal,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    const TextSpan(
                      text: 'Prevalence: ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: disease.prevalence,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight
                            .normal,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    const TextSpan(
                      text: 'Risk factors: ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: disease.riskFactors,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight
                            .normal,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    const TextSpan(
                      text: 'Treatment: ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: disease.treatment,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight
                            .normal,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    const TextSpan(
                      text: 'Prognosis: ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: disease.prognosis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight
                            .normal,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      UsingMedicinesPage(medicines: medicine)));
                        },
                      ),
                    );
                  },
                )
              else
                const Center(
                  child: Text("No medicines available"),
                ),
            ],
          ),
        ));
  }
}
