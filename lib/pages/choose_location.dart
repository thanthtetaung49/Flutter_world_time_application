import 'package:flutter/material.dart';
import 'package:world_time_application/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int countNumber = 0;

  List<WorldTime> locations = [
    WorldTime('Yangon', 'myanmar.png', 'Asia/Yangon'),
    WorldTime('London', 'uk.png', 'Europe/London'),
    WorldTime('Athens', 'germany.png', 'Europe/Berlin'),
    WorldTime('Cairo', 'egypt.png', 'Africa/Cairo'),
    WorldTime('Nairobi', 'Kenya.png', 'Africa/Nairobi'),
    WorldTime('Chicago', 'usa.png', 'America/Chicago'),
    WorldTime('New_York', 'usa.png', 'America/New_York'),
    WorldTime('Seoul', 'south_korea.png', 'Asia/Seoul'),
    WorldTime('Jakarta', 'indonesia.png', 'Asia/Jakarta'),
  ];

  void updateTime(int index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime
    });
  }

  // void getData () async {
  //   String username = await Future.delayed(const Duration(seconds: 3), () {
  //     return "Su Su";
  //   });

  //   int userAge = await Future.delayed(const Duration(seconds: 2), () {
  //     return 20;
  //   });

  //   print('$username - $userAge');
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[500],
        title: const Text(
          'choose a Location',
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Card(
                child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10.00, vertical: 20.00),
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].flag}'),
                ),
                title: Text(locations[index].location),
              ),
            ));
          }),
    );
  }
}
