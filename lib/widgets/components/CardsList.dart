// ignore_for_file: non_constant_identifier_names, no_leading_underscores_for_local_identifiers, unused_local_variable, avoid_print, file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/utilities/themeColors.dart';
import 'creaditcard.dart';

class CardsList extends StatefulWidget {
  const CardsList({super.key});

  @override
  State<CardsList> createState() => _CardsListState();
}

class _CardsListState extends State<CardsList> {
  List cardList = [];
  @override
  void initState() {
    getcards();
    super.initState();
  }

  void getcards() async {
    final db = FirebaseFirestore.instance;
    String cardnum, username;
    await db
        .collection("Cards")
        .where("uid", isEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .get()
        .then((value) => {
              for (var i in value.docs)
                {
                  cardnum = i.data().values.elementAt(0),
                  username = i.data().values.elementAt(2),
                  setState(() {
                    cardList.add(
                      Creaditcard(name: username, CardNumber: cardnum),
                    );
                  }),
                }
            })
        .onError((error, stackTrace) => {});
  }

  int cardnumber = 0;
  final PageController _pageController = PageController(initialPage: 0);
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  oonpagechage(int index) {
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
            itemBuilder: (context, index) => cardList[index],
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
  _DotIndecatorState();
  @override
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
