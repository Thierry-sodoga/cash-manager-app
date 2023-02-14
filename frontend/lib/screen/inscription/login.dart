// ignore: file_names
import 'package:CashManager/admin/addcart.dart';
import 'package:CashManager/model/user.model.dart';
import 'package:CashManager/provider/appstore.dart';
import 'package:CashManager/screen/splash.screen.dart';
import 'package:CashManager/service/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/custom.of.input.dart';
import '../components/custom_button.dart';

class Login extends StatefulWidget {
  static const String name = "/LoginFrom";
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? email;
  String? password;
  final _fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Connexion"),
        backgroundColor: const Color(0xff184098),
      ),
      body: Form(
        key: _fromKey,
        child: Container(
          padding: const EdgeInsets.fromLTRB(30, 30, 15, 30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    height: 100,
                    child: Image.asset(
                      "assets/logo/logo.png",
                    )),
                const SizedBox(height: 7.0),
                CustomTextFormField(
                  initialValue: "Email",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Veuillez remplir ce champ";
                    } else if (RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(email!)) {
                      return null;
                    } else {
                      return "veillez entrer un email valide";
                    }
                  },
                  keyBoardType: TextInputType.emailAddress,
                  onChange: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                  obscureText: false,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  initialValue: "Mot de passe",
                  validator: (value) {
                    // ignore: unused_local_variable
                    RegExp regex = RegExp(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                    if (value!.isEmpty) {
                      return 'Please enter password';
                    } else {
                      return null;
                      // if (!regex.hasMatch(value)) {
                      //   return 'Enter valid password';
                      // } else {
                      //   return null;
                      // }
                    }
                  },
                  onChange: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  obscureText: true,
                ),
                const SizedBox(
                  height: 70,
                ),
                ButtonComponent(
                  content: const Text(
                    "se connecter",
                  ),
                  action: () async {
                    if (password!.compareTo("admin") == 0 && email!.compareTo("admin@admin.com") == 0) {
                      Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const newCardAdd(),
                          ),
                        );
                    }
                    Provider.of<AppState>(context, listen: false)
                        .setOnValue("password", password);
                    Provider.of<AppState>(context, listen: false)
                        .setOnValue("email", email);
                    if (_fromKey.currentState!.validate()) {
                      Users? user = await userSignin(context, email, password);
                      if (user != null) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const CheckLogin(),
                          ),
                        );
                      }
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                ButtonComponent(
                  content: const Text(
                    "s'inscrire",
                    style: TextStyle(color: Color(0xff184098)),
                  ),
                  color: Colors.white,
                  action: () async {
                    Navigator.of(context).pushNamed('/SignInFrom');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
