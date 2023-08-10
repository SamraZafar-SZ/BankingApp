import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Appbar extends StatefulWidget {
  const Appbar({super.key});

  @override
  State<Appbar> createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 15.0, right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Home',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w800,
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/analytics-icon.svg'),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/search-icon.svg'),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: SvgPicture.asset('assets/more-icon.svg'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
