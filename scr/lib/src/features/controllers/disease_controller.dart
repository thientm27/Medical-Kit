
import 'package:scr/src/features/models/model_disease.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Disease>> getAllDiseases() async {
  final uri = Uri.parse('http://ronalbo2610-001-site1.ftempurl.com/api/Disease');
  try {
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> diseaseJsonList = json.decode(response.body);
      List<Disease> diseases = diseaseJsonList.map((json) => Disease.fromJson(json)).toList();
      return diseases;
    } else {
      throw Exception('Failed to fetch data');
    }
  } catch (e) {
    throw Exception('Error: $e');
  }
}