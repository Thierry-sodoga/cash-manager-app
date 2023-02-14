import 'package:CashManager/screen/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:CashManager/screen/inscription/login.dart';
import 'package:CashManager/screen/inscription/sign_up.first.dart';

/*class LoginPasswordArguments {
  String? phoneNumer;
  String? password;

  LoginPasswordArguments(this.phoneNumer, this.password);
}*/

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Login.name:
        return MaterialPageRoute(builder: (_) => const Login());
      case CartScreen.name:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case SignUpFrist.name:
        return MaterialPageRoute(builder: (_) => const SignUpFrist());
      // case LoginPassword.name:
      //   LoginPasswordArguments? args =
      //       settings.arguments as LoginPasswordArguments;

      //   return MaterialPageRoute(
      //       builder: (_) => LoginPassword(
      //             phoneNumer: args.phoneNumer,
      //             langue: args.langue,
      //             compteStatus: args.compteStatus,
      //           ));
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Text("No view for this route"),
          ),
        );
    }
  }
}
