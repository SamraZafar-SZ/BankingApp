import 'package:flutter/material.dart';

class Grid extends StatelessWidget {
  const Grid({super.key});

  @override
  Widget build(BuildContext context) {
    final List<IconButton> icons = [
      IconButton(
        onPressed: () {},
        icon: const Image(
          image: AssetImage('assets/funds.png'),
          height: 50,
        ),
      ),
      IconButton(
        onPressed: () {},
        icon: const Image(
          image: AssetImage('assets/funds.png'),
          height: 50,
        ),
      ),
      IconButton(
        onPressed: () {},
        icon: const Image(
          image: AssetImage('assets/funds.png'),
          height: 50,
        ),
      ),
      IconButton(
        onPressed: () {},
        icon: const Image(
          image: AssetImage('assets/funds.png'),
          height: 50,
        ),
      ),
      IconButton(
        onPressed: () {},
        icon: const Image(
          image: AssetImage('assets/funds.png'),
          height: 50,
        ),
      ),
      IconButton(
        onPressed: () {},
        icon: const Image(
          image: AssetImage('assets/funds.png'),
          height: 50,
        ),
      ),
      IconButton(
        onPressed: () {},
        icon: const Image(
          image: AssetImage('assets/funds.png'),
          height: 50,
        ),
      ),
      IconButton(
        onPressed: () {},
        icon: const Image(
          image: AssetImage('assets/funds.png'),
          height: 50,
        ),
      ),
      IconButton(
        onPressed: () {},
        icon: const Image(
          image: AssetImage('assets/funds.png'),
          height: 50,
        ),
      ),
      IconButton(
        onPressed: () {},
        icon: const Image(
          image: AssetImage('assets/funds.png'),
          height: 50,
        ),
      ),
      // Add more icon data here...
    ];
    return SizedBox(
      height: 350,
      child: GridView.count(
        crossAxisCount: 3,
        children: List.generate(icons.length, (index) {
          return Center(child: icons[index]);
        }),
      ),
    );
  }
}
