import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String date;
  String time;
  int per;
  final ref = FirebaseDatabase.instance.reference().child('Random');
  @override
  Widget build(BuildContext context) {
    ref.onValue.listen((event) {
      setState(() {
        date = event.snapshot.value['Percentage']['Date']; time = event.snapshot.value['Percentage']['Time']; per = event.snapshot.value['Percentage']['Value'];
      });
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('FlutterRTDB', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Text('DASHBOARD', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, color: Colors.lightBlue),),
              SizedBox(height: 20,),
              Text('Realtime Data', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
              SizedBox(height: 10,),
              Container(
                color: Colors.greenAccent,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Date: ${DateTime.now().day} / ${DateTime.now().month} / ${DateTime.now().year}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),),
                      SizedBox(height: 10,),
                      Text('Time: ${DateTime.now().hour} : ${DateTime.now().minute}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),),
                      SizedBox(height: 10,),
                      Text('Value: $per %', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 100,),
              Container(
                child: Column(
                  children: [
                    Text('Yash Jungade'),
                    Text('Flutter Realtime Database'),
              ],),
              )
            ],
          ),
        ),
      ),
    );
  }
}
