import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    // data = ModalRoute.of(context)!.settings.arguments as Map;
    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map ?? {};
    print(data);

    String dayTimeImage = data['isDayTime'] ? 'day.png' : 'night.png';
    Color bgColor =
        data['isDayTime'] ? Colors.lightBlueAccent : Colors.indigoAccent;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$dayTimeImage'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 30),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton.icon(
                        onPressed: () async {
                          dynamic result = await Navigator.pushNamed(context, '/location');
                          setState(() {
                            data = {
                              'location' : result['location'],
                              'flag' : result['flag'],
                              'time' : result['time'],
                              'isDayTime' : result['isDayTime']
                            };
                          });
                        },
                        icon: Icon(
                          Icons.edit_location,
                          color: Colors.grey[300],
                        ),
                        label: Text('Edit Location',
                            style: TextStyle(color: Colors.grey[300]))),
                    const SizedBox(height: 10.00),
                    Text(data['location'],
                        style: const TextStyle(color: Colors.white)),
                    const SizedBox(height: 10.00),
                    Text(
                      data['time'],
                      style: const TextStyle(
                          fontSize: 40.00,
                          letterSpacing: 2.00,
                          color: Colors.white),
                    )
                  ]),
            )),
      )),
    );
  }
}
