import 'package:c2_antonio_hany/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app = await Firebase.initializeApp();
  print("initialized: " + app.toString());
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
            headline1: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            headline2: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            headline3: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            headline4: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            headline5: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            subtitle2: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white54)),
      ),
      home: const HomePage(title: 'C2 Home'),
    );
  }
}
