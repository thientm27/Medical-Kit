import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:scr/src/features/screens/call.dart';

Future<void> navigateToCallPage(BuildContext context, String cailId) async {
  final sharedPref = await SharedPreferences.getInstance();
  final userId = sharedPref.getString('userId')!;
  final userName = sharedPref.getString('userName')!;
  if (!context.mounted) return;
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => CallPage(
        callID: cailId,
        userId: userId,
        userName: userName,
      ),
    ),
  );
}