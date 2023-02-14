import 'package:backoffice/admin/back.dart';
import 'package:backoffice/components/custom.of.input.dart';
import 'package:backoffice/components/custom_button.dart';
import 'package:flutter/material.dart';

class newCardAdd extends StatefulWidget {
  const newCardAdd({super.key});

  @override
  State<newCardAdd> createState() => _newCardAddState();
}

class _newCardAddState extends State<newCardAdd> {
  String? cardNumber;
  String? cardName;
  String? expiryDate;
  String? cvv;
  int? montant;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Ajouter une nouvoulle carte")),
        body: Form(
            child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(15, 30, 15, 5),
            child: Column(
              children: [
                CustomTextFormField(
                  initialValue: "Numero de carte",
                  validator: (value) {},
                  onChange: (value) {
                    cardNumber = value;
                  },
                  obscureText: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  initialValue: "Nom de carte",
                  validator: (value) {},
                  onChange: (value) {
                    cardName = value;
                  },
                  obscureText: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  initialValue: "Date d'expiration",
                  validator: (value) {},
                  onChange: (value) {
                    expiryDate = value;
                  },
                  obscureText: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  initialValue: "code CVV",
                  validator: (value) {},
                  onChange: (value) {
                    cvv = value;
                  },
                  obscureText: false,
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomTextFormField(
                  initialValue: "Montant",
                  validator: (value) {},
                  onChange: (value) {
                    montant = int.parse(value);
                  },
                  obscureText: false,
                ),
                const SizedBox(
                  height: 25,
                ),
                ButtonComponent(
                  content: const Text(
                    "Ajouter la carte",
                  ),
                  action: () async {
                    print("$cardNumber $cardName $expiryDate $cvv $montant");
                    await AddCarteBack(
                        cardNumber, cardName, expiryDate, cvv, montant);
                  },
                  color: const Color(0xffF08F5F),
                ),
              ],
            ),
          ),
        )));
  }
}
