// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_application_4/widgets/components/grid.dart';
import '../components/AppBar.dart';
import '../components/CardsList.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          Appbar(),
          CardsList(),
          Grid(),
        ],
      ),
    );
  }
}
