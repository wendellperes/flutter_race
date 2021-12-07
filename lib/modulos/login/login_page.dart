import 'package:flutter/material.dart';
import 'package:flutter_race1/shared/theme/app_theme.dart';
import 'package:flutter_race1/shared/theme/app_text.dart';
import 'package:flutter_race1/shared/widget/eleveted_button/eleveted_button.dart';
import 'package:flutter_race1/shared/widget/input_text/input_text.dart';
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
              'assets/images/logo.png',
              width: 200,
          ),
          InputText(label: 'E-mail', hint: 'Digite seu e-mail'),
          SizedBox(
            height: 18,
          ),
          InputText(label: 'Senha', hint: 'Digite sua Senha'),
          SizedBox(
            height: 14,
          ),
          // ignore: prefer_const_constructors
          Button(
            label: 'Entrar', onPressed: () {  }, type: ButtonType.none,
          ),
          SizedBox(
            height: 50,
          ),
          Button(
            label: 'Criar conta', onPressed: () {  }, type: ButtonType.outline,
          ),
          
          
        ],
      ),
    );

  }

}
