import 'package:flutter/material.dart';
import 'package:scr/src/features/models/model_using_history.dart';
import 'package:scr/src/constants/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:scr/src/features/controllers/using_history_controller.dart';
import 'package:date_only_field/date_only_field.dart';

class UsingHistoryPage extends StatefulWidget {
  const UsingHistoryPage({Key? key}): super(key: key);
@override
  State<UsingHistoryPage> createState() => _UsingHistoryPage();
}

class _UsingHistoryPage extends State<UsingHistoryPage>{
  List<UsingHistory> usingHistories = [];
  
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
      var sharedPref =await SharedPreferences.getInstance();
      String id = sharedPref.getString('productId')!;
      List<UsingHistory> fetchedUsingHistory = await getUsingHistory(id);
      setState(() {
        usingHistories = fetchedUsingHistory;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tOnBoardingPage1Color,
      appBar: AppBar(
        title:const Text('Using History'),
      ),
      body: ListView.builder(itemCount: usingHistories.length, itemBuilder: (context, index){
        UsingHistory usingHistory = usingHistories[index];
        Date startDate = Date.fromDateTime(DateTime.parse(usingHistory.startDate));
        Date endDate = Date.fromDateTime(DateTime.parse(usingHistory.endDate));
        return Card(
          child: ListTile(
            title: Text('Name: ${usingHistory.userName} - medicine: ${usingHistory.medicineName}'),     
            subtitle: Text('Start date: ${startDate.toString()} - End date: ${endDate.toString()}'),
            trailing:  const Icon(Icons.arrow_forward_rounded),
          )
        );      
      },
    )
    );
  }
}