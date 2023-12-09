import 'package:flutter/material.dart';
import 'package:world_time_application/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading';

  void setupWorldTime() async {
    WorldTime instance = WorldTime('Yangon', 'myanmar.png', 'Asia/Yangon');
    await instance.getTime();
    Navigator.pushReplacementNamed(context,'/home', arguments: {
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDayTime' : instance.isDayTime
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.indigoAccent,
      body: Padding(
        padding: EdgeInsets.all(50.00),
        child: Center(
          child: SpinKitRotatingCircle(color: Colors.white, size: 50.00),
        ),
      ),
    );
  }
}
