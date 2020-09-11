import 'package:flutter/material.dart';
import 'package:world_timer/services/world_time.dart';



class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Asia/Kolkata', location: 'India', flag: 'india.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async
  {
    WorldTime instance=locations[index];
    await instance.getTime();
    print(instance.isError);
    Navigator.pop(context,{
      'flag':instance.flag,
      'time':instance.time,
      'location':instance.location,
      'isDayTime':instance.isDayTime,
      'isError':instance.isError,
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text('Choose a location'),
        elevation: 0,
        centerTitle: true,
      ),
      body:ListView.builder(

        itemCount: locations.length,
          itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1.0,vertical: 1.0),
            child: (
            Card(
              color: Colors.grey[400],
              child:ListTile(
                onTap: (){ updateTime(index); },
                title:Text( locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),

            ),
            )
            ),
          );
    },
    )
    );
  }
}
