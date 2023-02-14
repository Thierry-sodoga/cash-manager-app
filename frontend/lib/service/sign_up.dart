import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:CashManager/model/user.model.dart';
import 'package:http/http.dart' as http;
import 'package:CashManager/provider/appstore.dart';
import 'package:CashManager/screen/splash.screen.dart';
import 'package:CashManager/service/user%20info.dart';
import 'package:fluttertoast/fluttertoast.dart';

userSignUp(BuildContext context) async {
  String? email =
      Provider.of<AppState>(context, listen: false).getValut("email");
  String? lastname =
      Provider.of<AppState>(context, listen: false).getValut("lastname");
  String? fistname =
      Provider.of<AppState>(context, listen: false).getValut("firstname");
  String? password =
      Provider.of<AppState>(context, listen: false).getValut("password");

  var url = Uri.http("190.92.134.65:8080", "/web-server-0.1/users/register");
  final http.Response response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'firstname': fistname,
      'lastname': lastname,
      'email': email,
      'password': password,
      "role": "customer"
    }),
  );

  Users? user = Users.fromJson(jsonDecode(response.body));
  if (kDebugMode) {
    print(jsonDecode(response.body));
  }
  // ignore: use_build_context_synchronously
  if (user.id != null) {
    if (kDebugMode) {
      print("ok ==========+> ${user.id}");
    }
    if (user != null) {
      await saveUser(user);
      // ignore: use_build_context_synchronously

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const CheckLogin(),
        ),
      );
    }
  } else {
    Fluttertoast.showToast(
      msg: response.body,
    );
  }
}

Future<Users?> userSignin(
    BuildContext context, String? email, String? password) async {
  Users? user;
  var url = Uri.http("190.92.134.65:8080", "/web-server-0.1/users/login");
  final http.Response response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{'email': email!, 'password': password!}),
  );

  var id = jsonDecode(response.body);
  if (kDebugMode) {
    print("Ok =========> $id");
  }
  if (id != 0) {
    // ignore: unused_local_variable

    if (kDebugMode) {
      print("id ================> $id");
    }
    var url = Uri.http("190.92.134.65:8080", "/web-server-0.1/users/$id");
    final http.Response responsed = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    // ignore: use_build_context_synchronously
    if (responsed.body != null) {
      user = Users.fromJson(jsonDecode(responsed.body));
      print(user.toJson());
      if (user != null) {
        await saveUser(user);
        // ignore: use_build_context_synchronously

      }
    }
  } else {
    Fluttertoast.showToast(
      msg: "Votre compte n'existe pas",
    );
  }
  return user;
}

userLogOut(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();
  int? id = prefs.getInt("id");
  if (id == null) {
    // ignore: use_build_context_synchronously
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CheckLogin(),
      ),
    );
  }
}
