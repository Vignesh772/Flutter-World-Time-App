import 'package:flutter/material.dart';
import 'package:world_timer/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {


  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time='LOADING...';
  void setupWorldTime() async
  {
    WorldTime instance=WorldTime(location:'India',flag:'India.png',url:'Asia/Kolkata');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'flag':instance.flag,
      'time':instance.time,
      'location':instance.location,
      'isDayTime':instance.isDayTime,
      'isError':instance.isError,
    });

  }



  @override
  void initState()
  {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body:Center(
        child:SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        ),
      )
    );
  }
}
