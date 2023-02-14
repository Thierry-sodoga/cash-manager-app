//http://190.92.134.65:8080/web-server-0.1/users/savecard
import 'dart:convert';

import 'package:CashManager/model/credit_carte.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

Future<CreditCarte?> checckCart(String number) async {
  var url =
      Uri.http("190.92.134.65:8080", "/web-server-0.1/users/getcard/$number");
  final http.Response response = await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  CreditCarte? carte = CreditCarte.fromJson(jsonDecode(response.body));
  if (kDebugMode) {
    print(jsonDecode(response.body));
  }
  // ignore: use_build_context_synchronously
  if (carte.id != null) {
    if (kDebugMode) {
      print(carte.toJson());
    }
  } else {
    Fluttertoast.showToast(
      msg: response.body,
    );
  }
  return carte;
}

bool operation(CreditCarte? carte, int montant) {
  if (carte!.balance > montant) {
    return true;
  }
  return false;
}

// ignore: non_constant_identifier_names
Future<CreditCarte?> UpdateCarte(CreditCarte carteInfo, int newsolde) async {
  var url = Uri.http("190.92.134.65:8080", "/web-server-0.1/users/updatecard");
  final http.Response response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      "id": carteInfo.id,
      "name": carteInfo.name,
      "number": carteInfo.number,
      "date": carteInfo.date,
      "cvv": carteInfo.cvv,
      "balance": newsolde,
    }),
  );

  CreditCarte? carte = CreditCarte.fromJson(jsonDecode(response.body));
  return carte;
}
