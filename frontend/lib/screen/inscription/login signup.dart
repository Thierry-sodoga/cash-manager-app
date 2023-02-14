// ignore: file_names
import 'package:flutter/material.dart';
import 'package:CashManager/screen/components/custom_button.dart';

class LoginSignUp extends StatefulWidget {
  const LoginSignUp({super.key});

  @override
  State<LoginSignUp> createState() => _LoginSignUpState();
}

class _LoginSignUpState extends State<LoginSignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 30, 15, 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Cash Manager",
              style: TextStyle(color: Color(0xff184098), fontSize: 25),
            ),
            SizedBox(
              height: 100,
              child: Image.asset(
                "assets/logo/logo.png",
              ),
            ),
            Container(
              child: Column(
                children: [
                  ButtonComponent(
                    content: const Text("s'inscrire"),
                    action: () async {
                      Navigator.of(context).pushNamed('/SignInFrom');
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ButtonComponent(
                    content: const Text(
                      "se connecter",
                      style: TextStyle(color: Color(0xff184098)),
                    ),
                    action: () {
                      Navigator.of(context).pushNamed('/LoginFrom');
                    },
                    color: Colors.white,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
