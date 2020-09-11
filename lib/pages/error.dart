import 'package:flutter/material.dart';



class error  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("ERRROOOORRRRRR");

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(50.0, 300.0, 50.0, 0.0),
          child: Column(
            children: <Widget>[
              Text("Error :(",
              style: TextStyle(
                fontSize: 40.0,
                color:Colors.red,
              ),),
              SizedBox(height: 10.0),
              Text("Please check your Internet Connection and restart the app",
                style: TextStyle(
                  fontSize: 20.0,
                  color:Colors.red,
              )),
            ],

          ),
        ),
      )

    );
  }
}
