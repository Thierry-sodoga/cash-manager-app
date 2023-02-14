import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:CashManager/config/route.dart';
import 'package:CashManager/provider/appstore.dart';
import 'screen/splash.screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppState(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(
                    primaryColorDark: Colors.white,
                    errorColor: Colors.red,
                    backgroundColor: Colors.white)
                .copyWith(background: Colors.white)),
        home: const CheckLogin(),
        onGenerateRoute: (settings) => AppRouter.generateRoute(settings),
      ),
    );
  }
}
