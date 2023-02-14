import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

Future<void> AddCarteBack(String? cardNumber, String? cardName,
    String? expiryDate, String? cvv, int? montant) async {
  var url = Uri.http("190.92.134.65:8080", "/web-server-0.1/users/savecard");
  final http.Response response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      "name": cardName,
      "number": cardNumber,
      "date": expiryDate,
      "cvv": cvv,
      "balance": "$montant",
    }),
  );
  Fluttertoast.showToast(
    msg: "${jsonDecode(response.body)}",
  );
}
