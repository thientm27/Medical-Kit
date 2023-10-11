import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:flutter/material.dart';

class CallPage extends StatefulWidget {
  const CallPage({
    Key? key,
    required this.callID,
    required this.userId,
    required this.userName,
  }) : super(key: key);
  final String callID;
  final String userId;
  final String userName;

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID: 1562385539,
      appSign:
          '759ce72224520d92759c54b87c9ae3d925c453e91bbc60c4c037251bdf1f3d56',
      userID: widget.userId,
      userName: widget.userName,
      callID: widget.callID,
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
        ..onOnlySelfInRoom = (context) => Navigator.of(context).pop(),
    );
  }
}
