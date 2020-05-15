import 'package:delivery/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Delivery',
      theme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(color: Colors.transparent, elevation: 0),
        textTheme: GoogleFonts.comfortaaTextTheme(),
        accentColor: Colors.amber,
        primarySwatch: Colors.amber,
      ),
      home: HomePage(),
    );
  }
}
