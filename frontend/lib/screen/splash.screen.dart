import 'package:CashManager/screen/inscription/login%20signup.dart';
import 'package:CashManager/screen/product_list.dart';
import 'package:flutter/material.dart';
import 'package:CashManager/model/user.model.dart';
import 'package:CashManager/service/user%20info.dart';

class CheckLogin extends StatefulWidget {
  const CheckLogin({super.key});

  @override
  State<CheckLogin> createState() => _CheckLoginState();
}

class _CheckLoginState extends State<CheckLogin> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(
          seconds: 3,
        ), () async {
      Users? user = await getUser();
      if (user != null) {
        // ignore: use_build_context_synchronously
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ProductList(),
          ),
        );
      } else {
        // ignore: use_build_context_synchronously
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const LoginSignUp(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            // gradient: RadialGradient(
            //   colors: [
            //     Color(0xff3FB33F),
            //     Color(0xff208020),
            //   ],
            // ),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(height: 7.0),
              SizedBox(
                  height: 150,
                  child: Image.asset(
                    "assets/logo/logo.png",
                  )),
              const SizedBox(height: 7.0),
              const Text(
                "Cash Manager",
                style: TextStyle(color: Color(0xff184098), fontSize: 25),
              ),

              // const Text(
              //   "E-coach",
              //   style: TextStyle(
              //     fontWeight: FontWeight.bold,
              //     fontSize: 50,
              //     color: Color(0xffF1FFF1),
              //     fontFamily: "SFROUDED",
              //     letterSpacing: -3,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
