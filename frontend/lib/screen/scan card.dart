import 'package:CashManager/database/db_helper.dart';
import 'package:CashManager/model/credit_carte.dart';
import 'package:CashManager/provider/appstore.dart';
import 'package:CashManager/service/checkcart.dart';
import 'package:CashManager/service/take_picter.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:card_scanner/card_scanner.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'components/custom.of.input.dart';
import 'components/custom_button.dart';

class ScanCard extends StatefulWidget {
  int montant;
  ScanCard({super.key, required this.montant});

  @override
  State<ScanCard> createState() => _ScanCardState(montant);
}

class _ScanCardState extends State<ScanCard> {
  DBHelper? dbHelper = DBHelper();
  String? cardNumber;
  String? cardName;
  String? expiryDate;
  String? cvv;
  int montant;
  _ScanCardState(this.montant);
  @override
  void initState() {
    super.initState();
    context.read<AppState>().getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
        child: Container(
            alignment: Alignment.center,
            child: cardNumber != null
                ? Form(
                    child: Container(
                    padding: const EdgeInsets.fromLTRB(15, 30, 15, 5),
                    child: Column(
                      children: [
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
                        ButtonComponent(
                          content: const Text(
                            "Payer",
                          ),
                          action: () async {
                            CreditCarte? carte = await checckCart(cardNumber!);
                            if (carte!.name.contains(cardName!) == 1) {
                              Fluttertoast.showToast(
                                msg: "Veuillez mettre le bon nom",
                              );
                            } else if (carte.date.contains(expiryDate!) == 1) {
                              Fluttertoast.showToast(
                                msg:
                                    "Veuillez mettre la bonne date d'expiration",
                              );
                            } else if (carte.cvv != int.parse(cvv!)) {
                              Fluttertoast.showToast(
                                msg: "Veuillez mettre le bon cvv",
                              );
                            } else {
                              bool value = operation(carte, montant);
                              print(value);
                              CreditCarte? newcarte = await UpdateCarte(
                                  carte, carte.balance - montant);
                              if (value == true && newcarte != null) {
                                // var list = await AppState().getData();
                                // print(list.length);
                                // int lenght = list.length;

                                // for (int index = 0; index < lenght; index = index + 1) {
                                //   dbHelper!.deleteCartItem(
                                //       list[lenght - 1 - index].id!);
                                //   AppState()
                                //       .removeItem(list[lenght - 1 - index].id!);

                                // }

                                Navigator.pop(context);
                                Fluttertoast.showToast(
                                  msg: "Payement effectué",
                                );
                              } else {
                                Navigator.pop(context);
                                Fluttertoast.showToast(
                                  msg: "Solde insuffisant",
                                );
                              }
                            }
                          },
                          color: const Color(0xffF08F5F),
                        ),
                      ],
                    ),
                  ))
                : Flex(
                    direction: Axis.vertical,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        const Image(
                          image: AssetImage("assets/logo/logo.png"),
                          height: 150,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          height: 45,
                          child: ButtonComponent(
                            content: const Text(
                              "Payer par carte",
                            ),
                            action: () async {
                              var cardDetails = await CardScanner.scanCard(
                                // ignore: prefer_const_constructors
                                scanOptions: CardScanOptions(
                                  scanCardHolderName: true,
                                  scanExpiryDate: true,
                                  possibleCardHolderNamePositions: const [
                                    CardHolderNameScanPosition.belowCardNumber
                                  ],
                                ),
                              );
                              setState(() {
                                cardNumber = cardDetails.cardNumber;
                                Fluttertoast.showToast(
                                  msg: "Numero de carte: $cardNumber",
                                );
                              });
                            },
                            color: const Color(0xffF08F5F),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                          height: 45,
                          child: ButtonComponent(
                            content: const Text(
                              "Payer par chèque",
                            ),
                            action: () async {
                              final cameras = await availableCameras();

                              // Get a specific camera from the list of available cameras.
                              final firstCamera = cameras.first;
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => TakePictureScreen(
                                    // Pass the appropriate camera to the TakePictureScreen widget.
                                    camera: firstCamera,
                                  ),
                                ),
                              );
                            },
                            color: const Color(0xffF08F5F),
                          ),
                        ),
                      ])),
      ),
    );
  }
}
