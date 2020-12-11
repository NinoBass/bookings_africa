import 'package:flutter/material.dart';
import 'package:bookings_africa/ui/home_view.dart';

void main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Bookings Africa',
    theme: ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: Colors.white,
    ),
    initialRoute: '/home',
    routes: {
      // '/': (context) => Loading();
      '/home': (context) => HomeView()
    },
  ));
}
