import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scr/src/features/models/model_user.dart';
import 'package:scr/src/features/screens/mainpage/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future login(BuildContext context, String email, String password) async {
  final uri = Uri.parse('http://10.0.2.2:5102/api/User/login');
  final headers = {'Content-Type': 'application/json'};
  final Map<String, dynamic> body = {
    "email": email,
    "password": password,
  };
  final response =
      await http.post(uri, headers: headers, body: jsonEncode(body));

  if (response.statusCode == 200) {
    final dynamic userJson = json.decode(response.body);
    User user = User.fromJson(userJson);
    Fluttertoast.showToast(
      msg: "Login Successful!",
    );
    var sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString('userName', user.name);
    sharedPref.setString('userId', user.id);
    sharedPref.setString('productId', user.productId);
    if (!context.mounted) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const HomePage()),
    );
  } else if (response.statusCode == 401) {
    Fluttertoast.showToast(
      msg: "Wrong email or password!",
    );
  } else {
    // Handle other error cases here.
    Fluttertoast.showToast(
      msg: "An error occurred during login.",
    );
  }
}

Future preLogin(BuildContext context, String code) async {
  final uri = Uri.parse('http://10.0.2.2:5102/api/Product/code?code=$code');
  final headers = {'Content-Type': 'application/json'};
  final response = await http.get(uri, headers: headers);

  if (response.statusCode == 200) {
    final dynamic responseBody = json.decode(response.body);
    if (responseBody is bool && responseBody == true) {
      // The response body is a boolean 'true'.
      Fluttertoast.showToast(
        msg: "Login Successful!",
      );
    } else if (response.statusCode == 401) {
      Fluttertoast.showToast(
        msg: "Wrong email or password!",
      );
    }
  } else {
    // Handle other error cases here.
    Fluttertoast.showToast(
      msg: "Error code: ${response.statusCode}",
    );
  }
}
