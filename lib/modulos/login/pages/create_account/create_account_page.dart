import 'package:flutter/material.dart';
import 'package:flutter_race1/modulos/login/pages/create_account/create_account_controller.dart';
import 'package:flutter_race1/shared/theme/app_theme.dart';
import 'package:flutter_race1/shared/widget/eleveted_button/eleveted_button.dart';
import 'package:flutter_race1/shared/widget/input_text/input_text.dart';
import 'package:validators/validators.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({ Key? key }) : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final controller = CreateAccountController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    controller.addListener(() {
       controller.state.when(
         success: (value) => Navigator.pushNamed(context, "/home"),
         error: (message, _) => scaffoldKey.currentState!.showBottomSheet((context) => 
        BottomSheet(
          onClosing: (){}, 
          builder: (context) => Container(
            child: Text(message),
            )
          )),
         orElse: (){}
         );
     });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppTheme.colors.background,
      appBar: AppBar(
        backgroundColor: AppTheme.colors.background,
        elevation: 0,
        leading: BackButton(
          color: AppTheme.colors.BackButton,
          ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 22),
        child: Form(
          key: controller.formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Criando uma Conta', style: AppTheme.textStyles.title,),
              Text('Mantenha seus gastos em dia', style: AppTheme.textStyles.subtitle),
              SizedBox(
                height: 38,
              ),
              InputText(
                label: 'Nome', 
                hint: 'Digite seu nome',
                validator: (value) => value.isNotEmpty ? null : "Digite um nome válido",
                onChanged: (value) => controller.onChrange(name: value),
              ),
              SizedBox(
                height: 18,
              ),
              InputText(
                label: 'E-mail', 
                hint: 'Digite seu e-mail',
                validator: (value) => isEmail(value) ? null : "Digite um e-mail válido",
                onChanged: (value) => controller.onChrange(email: value),
              ),
              SizedBox(
                height: 18,
              ),
              InputText(
                label: 'Senha', 
                hint: 'Digite sua Senha', 
                validator: (value) => value.length >= 6 ? null : "Digite uma senha válida",
                obscure: true,
                onChanged: (value) => controller.onChrange(password: value),
              ),
              SizedBox(
                height: 14,
              ),
              // ignore: prefer_const_constructors
              AnimatedBuilder(
                animation: controller, 
                builder: (_,__){
                  return controller.state.when(
                    loading: () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                      ],
                    ),
                    orElse: () => Button(
                      label: 'Criar conta', onPressed: () { 
                        controller.createAccount(

                        );
                      
                      }, type: ButtonType.fill,
                    ),
                  );
                }
              )
              
            ],
          ),
        ),
      ),
    );
  }
}