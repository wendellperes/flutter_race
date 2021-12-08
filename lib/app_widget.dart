import 'package:flutter/material.dart';

import 'modulos/home/home_page.dart';
import 'modulos/login/pages/login/login_page.dart';
import 'modulos/login/pages/create_account/create_account_page.dart';
import 'modulos/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Race #1',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => SplashPage(),
        "/login": (context) => LoginPage(),
        "/login/create-account": (context) => CreateAccountPage(),
        "/home": (context) => HomePage()
      },
    );
  }
}