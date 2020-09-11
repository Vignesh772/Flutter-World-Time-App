import 'dart:ffi';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override

  Map data={};
  Widget build(BuildContext context) {

    data=data.isNotEmpty ?data :  ModalRoute.of(context).settings.arguments ;
    print(data);
    if(data['isError'])
      {

        Navigator.pushReplacementNamed(context, '/error');
      }


      String bgImage = data['isDayTime'] ? 'day.jpg' : 'night2.jpg';
      Color bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo;





    return Scaffold(
      backgroundColor: bgColor,
      body:SafeArea(
          child:Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image:AssetImage('assets/$bgImage'),
                fit:BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(50.0,120.0,50.0,0.0),
              child: Column(
                children: <Widget>[
                  FlatButton.icon(
                      onPressed: () async {
                        dynamic result = await Navigator.pushNamed(context, '/location');
                        if(result['isError']){

                          Navigator.pushReplacementNamed(context, '/error');



                        }
                        setState(() {


                            data={
                              'time':result['time'],
                              'location':result['location'],
                              'flag':result['flag'],
                              'isDayTime':result['isDayTime'],
                              'isError':result['isError']
                            };



                        });
                      },
                      icon: Icon(
                          Icons.edit_location,
                          color: Colors.grey[300],
                      ),
                      label: Text(
                          'Edit Location',
                        style: TextStyle(
                          color:Colors.grey[300],
                          fontSize: 20.0,
                        ),

                      )),
                  SizedBox(height:20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color:Colors.white,
                      ),),



                    ],
                  ),
                  SizedBox(height:20.0),
                  Text(
                    data['time'],
                    style:TextStyle(
                      fontSize: 66.0,
                      color: Colors.white,
                    )
                  )

                ],
              ),
            ),
          ) ),
    );
  }
}
