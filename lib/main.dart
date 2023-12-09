import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/choose_location.dart';
import 'pages/loading.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (context) => const Loading(),
        '/home': (context) => const Home(),
        '/location' : (context) => const ChooseLocation(),
      }
  ));
}
