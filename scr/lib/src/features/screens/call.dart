import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CallPage extends StatefulWidget {
  const CallPage({Key? key, required this.callID}) : super(key: key);
  final String callID;

  @override
  _CallPageState createState() => _CallPageState();
}

class _CallPageState extends State<CallPage>{
  String userId = "";
  String userName = "";

 @override
  void initState() {
    super.initState();
    getLoginUser();
  }

  Future<void> getLoginUser() async {
      var sharedPref = await SharedPreferences.getInstance();
        String id = sharedPref.getString('userId')!;
        String name = sharedPref.getString('userName')!;

    setState(() {
      userId = id;
      userName = name;
      });
    }
  
  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID: 1562385539, 
      appSign: '759ce72224520d92759c54b87c9ae3d925c453e91bbc60c4c037251bdf1f3d56', 
      userID: userId,
      userName: userName,
      callID: widget.callID,
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall() 
        ..onOnlySelfInRoom = (context) => Navigator.of(context).pop(),
    );
  }
}