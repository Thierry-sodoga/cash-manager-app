import 'package:CashManager/model/user.model.dart';
import 'package:CashManager/screen/splash.screen.dart';
import 'package:CashManager/service/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:CashManager/provider/appstore.dart';

import '../components/custom.of.input.dart';
import '../components/custom_button.dart';

class SignUpFrist extends StatefulWidget {
  static const String name = "/SignInFrom";
  const SignUpFrist({super.key});

  @override
  State<SignUpFrist> createState() => _SignUpFristState();
}

class _SignUpFristState extends State<SignUpFrist> {
  String? firstName;
  String? lastName;
  String? password;
  String? email;
  String? confirm;

  final _fromKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double wdh = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Inscription"),
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
                      initialValue: "Last Name",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Veuillez remplir ce champ";
                        }
                        return null;
                      },
                      onChange: (value) {
                        setState(() {
                          lastName = value;
                        });
                      },
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextFormField(
                      initialValue: "First Name",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Veuillez remplir ce champ";
                        }
                        return null;
                      },
                      onChange: (value) {
                        setState(() {
                          firstName = value;
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
                        RegExp regex = RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                        if (value!.isEmpty) {
                          return 'Please enter password';
                        } else {
                          if (!regex.hasMatch(value) && value.length < 8) {
                            return 'Enter valid password';
                          } else {
                            return null;
                          }
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
                      height: 30,
                    ),
                    CustomTextFormField(
                      initialValue: "Confirmation du mot de passe",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Veuillez remplir ce champ";
                        } else if (value.compareTo(password!) != 0) {
                          return "Veuillez entrer le meme mot de passe";
                        }
                        return null;
                      },
                      onChange: (value) {
                        setState(() {
                          confirm = value;
                        });
                      },
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ButtonComponent(
                      content: const Text("s'inscrire"),
                      action: () async {
                        if (_fromKey.currentState!.validate()) {
                          Provider.of<AppState>(context, listen: false)
                              .setOnValue("firstname", firstName);
                          Provider.of<AppState>(context, listen: false)
                              .setOnValue("lastname", lastName);
                          Provider.of<AppState>(context, listen: false)
                              .setOnValue("password", password);
                          Provider.of<AppState>(context, listen: false)
                              .setOnValue("email", email);
                          await userSignUp(context);
                          
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
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
              ),
            )));
  }
}
