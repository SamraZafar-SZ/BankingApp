// ignore_for_file: file_names
import 'package:flutter/material.dart';
import '../components/AppBar.dart';
import '../components/CardsList.dart';
import '../components/RecentTransections.dart';

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
          RecentTransactions(),
        ],
      ),
    );
  }
}
