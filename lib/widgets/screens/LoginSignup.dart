import 'package:flutter/material.dart';

class SignAndLogin extends StatefulWidget {
  const SignAndLogin({super.key});

  @override
  State<SignAndLogin> createState() => _SignAndLoginState();
}

class _SignAndLoginState extends State<SignAndLogin> {
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
                height: 100,
              ),
              const SizedBox(
                height: 20,
              ),
              const TextField(
                decoration: InputDecoration(
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
              const TextField(
                decoration: InputDecoration(
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
              ElevatedButton(
                onPressed: () {},
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
                child: const Text('Sign In'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
