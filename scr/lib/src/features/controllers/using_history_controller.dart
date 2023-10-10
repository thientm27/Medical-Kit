import 'package:flutter/material.dart';
import 'package:scr/src/features/models/model_using_history.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // Import this for jsonEncode
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scr/src/features/screens/mainpage/main_page.dart';

Future addUsingHistory(BuildContext context, productId, String medicineName, UsingHistory usingHistory) async 
{
  final uri = Uri.parse('http://10.0.2.2:5102/api/UsingHistory?id=$productId&medicineName=$medicineName');
  final headers = {'Content-Type': 'application/json'};

  Map<String, dynamic> historyJson = usingHistory.toJson();

final response = await http.put(uri, headers: headers, body: jsonEncode(historyJson));
    
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
    msg: "good",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER
  );
   if (!context.mounted) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const HomePage()),
    );
    } else {
      Fluttertoast.showToast(
    msg: "An error occurred with code ${response. statusCode}",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER
  );
    }
}

Future<List<UsingHistory>> getUsingHistory(String id) async {
  final uri = Uri.parse('http://10.0.2.2:5102/api/UsingHistory/?id=$id');
  try {
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> usingHistoryJsonList  = json.decode(response.body);
      List<UsingHistory> usingHistory = usingHistoryJsonList.map((json) => UsingHistory.fromJson(json)).toList();
      return usingHistory;
    } else {
      throw Exception('Failed to fetch data');
    }
  } catch (e) {
    throw Exception('Error: $e');
  }
}