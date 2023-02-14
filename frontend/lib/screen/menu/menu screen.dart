// ignore_for_file: file_names

import 'package:CashManager/screen/profil.dart';
import 'package:flutter/material.dart';
import 'package:CashManager/screen/menu/model%20option.dart';
import 'package:CashManager/service/sign_up.dart';

showAlerte(BuildContext context, double wdt) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              //alignment: Alignment.centerLeft,
              children: <Widget>[
                Positioned(
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(15, 20, 15, 30),
                    width: wdt,
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                            height: 100,
                            child: Image.asset(
                              "assets/logo/logo.png",
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        OptionMenu(
                          action: () {
                            Navigator.pop(context);
                          },
                          icon: const ImageIcon(
                            AssetImage('assets/icone/home.png'),
                            color: Color(0xff184098),
                          ),
                          contenent: "Acceuil",
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        OptionMenu(
                          action: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Profile()));

                            //
                          },
                          icon: const ImageIcon(
                            AssetImage('assets/icone/Layer 2.png'),
                            color: Color(0xff184098),
                          ),
                          contenent: "Mon profil",
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        OptionMenu(
                          action: () {},
                          icon: const ImageIcon(
                            AssetImage('assets/icone/megaphone.png'),
                            color: Color(0xff184098),
                          ),
                          contenent: "Mes Annonces",
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        OptionMenu(
                          action: () {},
                          icon: const Icon(
                            Icons.notifications,
                            color: Color(0xff184098),
                          ),
                          contenent: "Notifications",
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        OptionMenu(
                          action: () {
                            userLogOut(context);
                          },
                          icon: const Icon(
                            Icons.logout,
                            color: Color(0xff184098),
                          ),
                          contenent: "Déconnexion",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          height: 2,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        OptionMenu(
                          action: () {},
                          icon: const Icon(
                            Icons.share,
                            color: Color(0xff184098),
                          ),
                          contenent: "Partager l'application",
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        OptionMenu(
                          action: () {},
                          icon: const ImageIcon(
                            AssetImage('assets/icone/information.png'),
                            color: Color(0xff184098),
                          ),
                          contenent: "A Propos",
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ));
      });
}
