// ignore_for_file: file_names, non_constant_identifier_names
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/widgets/components/CustomTextField.dart';
import 'package:flutter_application_4/widgets/components/CustomeElevatedButton.dart';
import '../components/home.dart';

class SignAndLogin extends StatefulWidget {
  const SignAndLogin({super.key});
  @override
  State<SignAndLogin> createState() => _SignAndLoginState();
}

class _SignAndLoginState extends State<SignAndLogin> {
  final _controller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _confirmpassword = TextEditingController();
  @override
  void dispose() {
    _passwordcontroller.dispose();
    _confirmpassword.dispose();
    _controller.dispose();
    super.dispose();
  }

  bool flag = false;
  void signuppage() {
    setState(() {
      flag == false ? flag = true : flag = false;
    });
  }

  Future<void> AddUser() async {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: _controller.text,
          password: _passwordcontroller.text,
        )
        .then(
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Home(),
            ),
          ) as FutureOr Function(UserCredential value),
        )
        .onError(
          (error, stackTrace) => print(
            'Error ${error.toString()}',
          ),
        );
  }
  Future<void> Signinuser() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
          email: _controller.text,
          password: _passwordcontroller.text,
        )
        .then(
          (value) => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Home(),
            ),
          ),
        )
        .onError(
          (error, stackTrace) => print(error.toString()),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/payment.png',
                height: 200,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: _controller,
                string: 'Email',
                keyboardtype: TextInputType.emailAddress,
                obse: false,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: _passwordcontroller,
                string: 'Password',
                keyboardtype: TextInputType.text,
                obse: true,
              ),
              const SizedBox(
                height: 20,
              ),
              flag == true
                  ? CustomTextField(
                      controller: _confirmpassword,
                      string: 'Confirm Password',
                      keyboardtype: TextInputType.text,
                      obse: true,
                    )
                  : Container(),
              flag == true
                  ? const SizedBox(
                      height: 20,
                    )
                  : Container(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomeElevated(
                    flag: flag,
                    AddUser: AddUser,
                    Signinuser: Signinuser,
                    txt1: 'Sign Up',
                    txt2: 'Log In',
                  ),
                  ElevatedButton_(
                    signuppage: signuppage,
                    flag: flag,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
