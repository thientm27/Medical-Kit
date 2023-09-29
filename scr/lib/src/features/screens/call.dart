import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class CallPage extends StatelessWidget {
  const CallPage({Key? key, required this.callID}) : super(key: key);
  final String callID;

  @override
  Widget build(BuildContext context) {
    final random = Random();
    return ZegoUIKitPrebuiltCall(
      appID: 1562385539, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
      appSign: '759ce72224520d92759c54b87c9ae3d925c453e91bbc60c4c037251bdf1f3d56', // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
      userID: (random.nextInt(10) + 1).toString(),
      userName: 'user_name',
      callID: callID,
      // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall() 
        ..onOnlySelfInRoom = (context) => Navigator.of(context).pop(),
    );
  }
}