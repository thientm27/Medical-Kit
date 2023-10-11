
import 'package:scr/src/features/models/model_medicine.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Medicine>> getMyBoxMedicines(String id) async {
  final uri = Uri.parse('http://ronalbo2610-001-site1.ftempurl.com/api/Medicine/?id=$id');
  try {
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> medicineJsonList  = json.decode(response.body);
      List<Medicine> medicines = medicineJsonList.map((json) => Medicine.fromJson(json)).toList();
      return medicines;
    } else {
      throw Exception('Failed to fetch data');
    }
  } catch (e) {
    throw Exception('Error: $e');
  }
}