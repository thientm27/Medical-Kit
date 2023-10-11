import 'package:flutter/material.dart';
import 'package:scr/src/features/models/model_medicine.dart';
import 'package:scr/src/constants/colors.dart';
import 'package:scr/src/features/controllers/using_history_controller.dart';
import 'package:scr/src/features/models/model_using_history.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class UsingMedicinesPage extends StatefulWidget {
  final Medicine medicines;

  const UsingMedicinesPage({
    Key? key,
    required this.medicines,
  }) : super(key: key);
  @override
  State<UsingMedicinesPage> createState() => _UsingMedicinesPage();
}

class _UsingMedicinesPage extends State<UsingMedicinesPage> {
  final TextEditingController nameController = TextEditingController();
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  int selectedNumber = 1;

  Future<void> selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: startDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != startDate) {
      setState(() {
        startDate = picked;
      });
    }
  }

  Future<void> selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: startDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != startDate) {
      setState(() {
        endDate = picked;
      });
    }
  }

  @override
  void dispose() {
    // Dispose of the controller when it's no longer needed to prevent memory leaks
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: tOnBoardingPage1Color,
        appBar: AppBar(
          title: const Text(
            'Using Medicine',
            style: TextStyle(
                fontSize: 16,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
            width: size.width,
            height: size.height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xFFededed),
              Color(0xFF9a9a9a),
              Color(0xFF808080),
              Color(0xFF9a9a9a),
              Color(0xFFededed),
            ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 60.0),
                      Center(
                        child: Text(
                          widget.medicines.name,
                          style: const TextStyle(
                              fontSize: 32,
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Center(
                        child: Text(
                          widget.medicines.notes,
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                      const SizedBox(height: 60.0),
                      Center(
                          child: Container(
                        padding: const EdgeInsets.all(20.0),
                        width: size.width * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          border: Border.all(
                            color: Colors.grey, // Set the border color
                            width: 1.0, // Set the border width
                          ),
                          borderRadius: BorderRadius.circular(
                              10.0), // Add rounded corners
                        ),
                        child: Column(
                          children: [
                            TextField(
                              controller: nameController,
                              decoration: const InputDecoration(
                                labelText: "Enter patient's name",
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Column(
                                    children: [
                                      Text(
                                        'Start date:',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      SizedBox(height: 50.0),
                                    ],
                                  ),
                                  const SizedBox(width: 20.0),
                                  Column(children: [
                                    Text(
                                      startDate.toString().split(' ')[0],
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(width: 20.0),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black
                                              .withOpacity(0.4), // Border color
                                          width: 1, // Border width
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            8.0), // Border radius
                                      ),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors
                                              .transparent, // Make button background transparent
                                          elevation: 0, // Remove button shadow
                                        ),
                                        onPressed: () async {
                                          await selectStartDate(context);
                                        },
                                        child: const Text(
                                          'Select start date',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),),
                                      ),
                                    )
                                  ]),
                                ]),
                            const SizedBox(height: 20.0),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Column(
                                    children: [
                                      Text(
                                        'End date:',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      SizedBox(height: 50.0),
                                    ],
                                  ),
                                  const SizedBox(width: 20.0),
                                  Column(children: [
                                    Text(
                                      endDate.toString().split(' ')[0],
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(width: 20.0),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black
                                              .withOpacity(0.4), // Border color
                                          width: 1, // Border width
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            8.0), // Border radius
                                      ),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors
                                              .transparent, // Make button background transparent
                                          elevation: 0, // Remove button shadow
                                        ),
                                        onPressed: () async {
                                          await selectEndDate(context);
                                        },
                                        child: const Text(
                                          'Select end date',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),),
                                      ),
                                    )
                                  ]),
                                ]),
                            const SizedBox(height: 20.0),
                            TextField(
                              keyboardType: TextInputType
                                  .number, // Specify input type for numbers
                              onChanged: (value) {
                                // Handle the number input
                                if (value.isEmpty) {
                                  setState(() {
                                    selectedNumber =
                                        1; // Set to default if empty
                                  });
                                } else {
                                  setState(() {
                                    selectedNumber = int.parse(value);
                                  });
                                }
                              },
                              decoration: const InputDecoration(
                                labelText: 'Input the number of unit:',
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            ElevatedButton(
                              onPressed: () async {
                                var sharedPref =
                                    await SharedPreferences.getInstance();
                                String id = sharedPref.getString('productId')!;
                                if (!mounted) return;
                                addUsingHistory(
                                    context,
                                    id,
                                    widget.medicines.name,
                                    UsingHistory(
                                        id: const Uuid().v4(),
                                        userName: nameController.text,
                                        startDate:
                                            startDate.toUtc().toIso8601String(),
                                        endDate:
                                            startDate.toUtc().toIso8601String(),
                                        quantity: selectedNumber,
                                        status: 1));
                              },
                              child: const Text('Use!'),
                            ),
                          ],
                        ),
                      ))
                    ]))));
  }
}
