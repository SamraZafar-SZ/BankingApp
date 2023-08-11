// ignore_for_file: non_constant_identifier_names, no_leading_underscores_for_local_identifiers, unused_local_variable, avoid_print

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/utilities/themeColors.dart';
import 'creaditcard.dart';
import 'package:http/http.dart' as http;

class CardsList extends StatefulWidget {
  const CardsList({super.key});

  @override
  State<CardsList> createState() => _CardsListState();
}

class _CardsListState extends State<CardsList> {
  void Addcards() async {
    final ref = FirebaseDatabase.instance.ref();
    final shot = await ref.child('Cards').get();
    if (shot.exists) {
      print(shot.value);
    } else {
      print('Error');
    }
  }

  List cardList = [
    Creaditcard(),
    Creaditcard(),
    Creaditcard(),
    Creaditcard(),
    Creaditcard(),
    Creaditcard(),
  ];
  int cardnumber = 0;
  final PageController _pageController = PageController(initialPage: 0);
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  oonpagechage(int index) {
    Addcards();
    setState(() {
      cardnumber = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding:
              EdgeInsets.only(top: 30, left: 15.0, right: 15.0, bottom: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Your Cards',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 246.0,
          child: PageView.builder(
            itemCount: cardList.length,
            scrollDirection: Axis.horizontal,
            controller: _pageController,
            onPageChanged: oonpagechage,
            itemBuilder: (context, index) => const Creaditcard(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < cardList.length; i++)
                if (cardnumber == i)
                  const DotIndecator(
                    isActive: true,
                  )
                else
                  const DotIndecator(
                    isActive: false,
                  )
            ],
          ),
        )
      ],
    );
  }
}

class DotIndecator extends StatefulWidget {
  const DotIndecator({super.key, required this.isActive});
  final bool isActive;

  @override
  State<DotIndecator> createState() => _DotIndecatorState();
}

class _DotIndecatorState extends State<DotIndecator> {
  @override
  _DotIndecatorState();
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        height: 8.0,
        width: 8.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: widget.isActive ? ThemeColors.black : ThemeColors.grey,
        ),
      ),
    );
  }
}
