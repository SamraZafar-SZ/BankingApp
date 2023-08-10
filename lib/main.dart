import 'package:flutter/material.dart';
import 'package:flutter_application_4/widgets/home.dart';
import 'package:flutter_application_4/widgets/screens/LoginSignup.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Widget? activescreen;

  @override
  void initState() {
    activescreen = SignAndLogin(switchscreen);
    super.initState();
  }

  void switchscreen() {
    setState(() {
      activescreen = const Home();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: activescreen,
    );
  }
}
