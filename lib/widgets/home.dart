// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_4/widgets/screens/HomeScreen.dart';
import 'package:flutter_svg/svg.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selIdx = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> widOptions = [
      HomeScreen(),
      HomeScreen(),
      HomeScreen(),
      HomeScreen(),
    ];
    void ontap(index) {
      setState(() {
        selIdx = index;
      });
    }

    return Scaffold(
      body: widOptions.elementAt(selIdx),
      bottomNavigationBar: BottomNavigationBar(
        onTap: ontap,
        fixedColor: Colors.black,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/home-icon.svg'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/transactions-icon.svg'),
            label: 'Transetions',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/settings-icon.svg'),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/smiley-icon.svg'),
            label: 'Account',
          )
        ],
      ),
    );
  }
}
