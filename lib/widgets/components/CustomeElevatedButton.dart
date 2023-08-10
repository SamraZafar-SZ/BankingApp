// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class CustomeElevated extends StatelessWidget {
  const CustomeElevated({
    super.key,
    required this.flag,
    required this.AddUser,
    required this.Signinuser,
    required this.txt1,
    required this.txt2,
  });
  final bool flag;
  final void Function() AddUser, Signinuser;
  final String txt1, txt2;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        flag == true ? AddUser() : Signinuser();
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          Colors.black,
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: 50,
          ),
        ),
      ),
      child: flag == true ? Text(txt1) : Text(txt2),
    );
  }
}

class ElevatedButton_ extends StatelessWidget {
  const ElevatedButton_(
      {super.key, required this.signuppage, required this.flag});
  final bool flag;
  final void Function() signuppage;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        signuppage();
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          Colors.black,
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: 50,
          ),
        ),
      ),
      child: flag == false ? const Text('Join With Us') : const Text('Log In'),
    );
  }
}
