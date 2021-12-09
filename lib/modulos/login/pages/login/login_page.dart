import 'package:flutter/material.dart';
import 'package:flutter_race1/modulos/login/pages/login/login_controller.dart';
import 'package:flutter_race1/modulos/login/repositories/login_repository.dart';
import 'package:flutter_race1/modulos/login/repositories/login_repository_imp.dart';
import 'package:flutter_race1/shared/services/app_database.dart';
import 'package:flutter_race1/shared/theme/app_theme.dart';
import 'package:flutter_race1/shared/theme/app_text.dart';
import 'package:flutter_race1/shared/widget/eleveted_button/eleveted_button.dart';
import 'package:flutter_race1/shared/widget/input_text/input_text.dart';
import 'package:validators/validators.dart';
class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginController controller;
  final scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  void initState() {
    // TODO: implement initState

    controller = LoginController(
      repository: LoginRepositoryImpl(database: AppDatabase.instance)
      );

    controller.addListener(() { 
      controller.state.when(
        success: (value) => Navigator.pushReplacementNamed(context, "/home" , arguments: value),
        
        error: (message, _) => scaffoldKey.currentState!.showBottomSheet((context) => 
        BottomSheet(
          onClosing: (){}, 
          builder: (context) => Container(
            child: Text(message),
            )
          )),
        
        loading: () => print("loading..."),
        
        orElse: (){}
      );
     });
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppTheme.colors.background,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 22),
        child: Form(
          key: controller.formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                  'assets/images/logo.png',
                  width: 200,
              ),
              InputText(
                label: 'E-mail', 
                hint: 'Digite seu e-mail',
                validator: (value)=>isEmail(value) ? null : "Digite um e-mail válido!",
                onChanged: (value) => controller.onChrange(email: value),
              
              ),
              SizedBox(
                height: 18,
              ),
              InputText(
                label: 'Senha', 
                hint: 'Digite sua Senha', 
                obscure: true,
                validator: (value)=> value.length >=6 ? null : "Digite uma senha mais forte!",
                onChanged: (value) => controller.onChrange(password: value),
              ),
              SizedBox(
                height: 14,
              ),
              AnimatedBuilder(
                animation: controller, 
                builder: (_,__){
                  return controller.state.when(
                    loading: () => CircularProgressIndicator(),
                    orElse: () => Column(
                      children: [
                        Button(
                          label: 'Entrar', 
                          onPressed: () { 
                          controller.login();
                          }, type: ButtonType.fill,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Button(
                          label: 'Criar conta', 
                          onPressed: () {  
                            Navigator.pushNamed(context, "/login/create-account");
                          }, 
                          type: ButtonType.outline,
                        ),
                      ],
                    ),
                  );
                }
              ),
              
              
              
            ],
          ),
        ),
      ),
    );

  }
}
