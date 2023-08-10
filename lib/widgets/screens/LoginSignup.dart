// ignore_for_file: file_names, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SignAndLogin extends StatefulWidget {
  const SignAndLogin(this.switchscreen, {super.key});
  final void Function() switchscreen;
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
          (value) => widget.switchscreen(),
        )
        .onError(
          (error, stackTrace) => print('Error ${error.toString()}'),
        );
  }

  Future<void> Signinuser() async {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
          email: _controller.text,
          password: _passwordcontroller.text,
        )
        .then(
          (value) => widget.switchscreen(),
        )
        .onError(
          (error, stackTrace) => print('${error.toString()}'),
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
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  label: Text(
                    'Email',
                    style: TextStyle(
                      inherit: true,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _passwordcontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  label: Text(
                    'Password',
                    style: TextStyle(
                      inherit: true,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                obscureText: true,
              ),
              const SizedBox(
                height: 20,
              ),
              flag == true
                  ? TextField(
                      controller: _confirmpassword,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        label: Text(
                          'Confirm Password',
                          style: TextStyle(
                            inherit: true,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      obscureText: true,
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
                  ElevatedButton(
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
                    child: flag == true
                        ? const Text('Sign Up')
                        : const Text('Sign In'),
                  ),
                  ElevatedButton(
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
                    child: flag == false
                        ? const Text('Join With Us')
                        : const Text('Log In'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
