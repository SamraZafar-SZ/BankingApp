// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter_application_4/utilities/themeColors.dart';
import 'package:flutter_svg/svg.dart';
import '../../utilities/themeStyle.dart';

class Creaditcard extends StatefulWidget {
  const Creaditcard({super.key, required this.name, required this.CardNumber});
  final String name;
  final String CardNumber;

  @override
  State<Creaditcard> createState() => _CreaditcardState();
}

class _CreaditcardState extends State<Creaditcard> {
  bool flag = false;
  @override
  Widget build(BuildContext context) {
    List<String> card = widget.CardNumber.split("-");
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 216,
        width: 380,
        decoration: BoxDecoration(
          color: ThemeColors.fluorescentCopper,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      'assets/mastercard.svg',
                      height: 50,
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          flag == true ? flag = false : flag = true;
                        });
                      },
                      icon: SvgPicture.asset('assets/hide-icon.svg'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0, bottom: 32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: flag,
                      child: Text(
                        widget.name,
                        style: ThemeStyles.cardDetails,
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(right: 6.0),
                            child: Visibility(
                              visible: true,
                              child: Text(
                                card[0],
                                style: ThemeStyles.cardDetails,
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6.0),
                          child: flag == false
                              ? SvgPicture.asset('assets/card-dots.svg')
                              : Text(
                                  card[1],
                                  style: ThemeStyles.cardDetails,
                                ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6.0),
                          child: flag == false
                              ? SvgPicture.asset('assets/card-dots.svg')
                              : Text(
                                  card[2],
                                  style: ThemeStyles.cardDetails,
                                ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 6.0),
                          child: Text(
                            card[3],
                            style: ThemeStyles.cardDetails,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
