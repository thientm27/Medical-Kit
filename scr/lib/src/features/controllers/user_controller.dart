import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scr/src/features/models/model_user.dart';
import 'package:scr/src/features/screens/login/login_screen.dart';
import 'package:scr/src/features/screens/login/register_screen.dart';
import 'package:scr/src/features/screens/mainpage/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future login(BuildContext context, String email, String password) async {
  final uri =
      Uri.parse('http://ronalbo2610-001-site1.ftempurl.com/api/User/login');
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
    var sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString('userName', user.name);
    sharedPref.setString('userId', user.id);
    sharedPref.setString('productId', user.productId);
    Fluttertoast.showToast(
      msg: "Login Successful!",
    );
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
      msg: "Wrong email or password!",
    );
  }
}

Future preLogin(BuildContext context, String code) async {
  final uri = Uri.parse(
      'http://ronalbo2610-001-site1.ftempurl.com/api/User/check?code=$code');
  final headers = {'Content-Type': 'application/json'};
  final response = await http.get(uri, headers: headers);
  if (response.statusCode == 200) {
    final String responseBody = json.decode(response.body);
    if (!context.mounted) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
          builder: (_) => RegisterScreen(productId: responseBody)),
    );
    Fluttertoast.showToast(
      msg: "Welcome!",
    );
  } else {
    // Handle other error cases here.
    Fluttertoast.showToast(
      msg: "Wrong code",
    );
  }
}

Future signUp(BuildContext context, User user) async {
  final uri =
      Uri.parse('http://ronalbo2610-001-site1.ftempurl.com/api/User/signup');
  final headers = {'Content-Type': 'application/json'};

  Map<String, dynamic> historyJson = user.toJson();

  final response =
      await http.post(uri, headers: headers, body: jsonEncode(historyJson));

  if (response.statusCode == 200) {
    Fluttertoast.showToast(
        msg: "good",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER);
    if (!context.mounted) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    );
  } else {
    Fluttertoast.showToast(
        msg: "Sign up fail",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER);
  }
}
