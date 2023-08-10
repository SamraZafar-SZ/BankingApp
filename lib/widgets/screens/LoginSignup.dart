import 'package:flutter/material.dart';

class SignAndLogin extends StatefulWidget {
  const SignAndLogin(this.switchscreen, {super.key});
  final void Function() switchscreen;
  @override
  State<SignAndLogin> createState() => _SignAndLoginState();
}

class _SignAndLoginState extends State<SignAndLogin> {
  bool flag = false;
  void signuppage() {
    setState(() {
      flag == false ? flag = true : flag = false;
    });
  }

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
              flag == true
                  ? const TextField(
                      decoration: InputDecoration(
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
                      widget.switchscreen();
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
