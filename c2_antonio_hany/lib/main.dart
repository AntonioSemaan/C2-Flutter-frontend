import 'package:c2_antonio_hany/master.dart';
import 'package:c2_antonio_hany/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projet C2',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
              headline3: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,))),
      home: const HomePage(title: 'C2 Home'),
    );
  }
}
