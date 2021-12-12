import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutter_race1/modulos/create/create_controller.dart';
import 'package:flutter_race1/modulos/create/repositories/create_repository_impl.dart';
import 'package:flutter_race1/shared/services/app_database.dart';
import 'package:flutter_race1/shared/widget/eleveted_button/eleveted_button.dart';
import 'package:flutter_race1/shared/widget/input_text/input_text.dart';

class CreateBottomsheet extends StatefulWidget {
  const CreateBottomsheet({Key? key}) : super(key: key);

  @override
  _CreateBottomsheetState createState() => _CreateBottomsheetState();
}

class _CreateBottomsheetState extends State<CreateBottomsheet> {
  late final CreateController controller;
  final dateNow = DateTime.now();
  String dataAtual = '';
  
  @override
  void initState() {
    controller = CreateController(repository: CreateRepositoryImpl(database: AppDatabase.instance));
    controller.addListener(() { 
      controller.state.when(
        success: (_){
          Navigator.pop(context);
        },
        orElse: (){}
      );
     });
    dataAtual = ('${dateNow.day}/${dateNow.month}/${dateNow.year}');
    
    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 42, vertical: 16),
      child: Form(
        key: controller.formkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 32,
              ),
              InputText(
                label: "Produto", 
                hint: "Digite um nome",
                onChanged: (value) => controller.onChrange(name : value),
                validator: (value) => value.isNotEmpty ? null : "Favor digitar um nome",
              ),
              SizedBox(
                height: 8,
              ),
              InputText(
                label: "Preço", 
                hint: "Digite o valor",
                onChanged: (value) => controller.onChrange(price: value),
                validator: (value) => value.isNotEmpty ? null : "Favor digitar um Valor",
                keyboardType: TextInputType.number,
                inputFormatters: [
                  MoneyInputFormatter(
                      leadingSymbol: "R\$"
                  )
                ],
              ),
              SizedBox(
                height: 8,
              ),
              InputText(
                label: "Data da compra", 
                hint: "Digite a data  ${dataAtual}",
                onChanged: (value) => controller.onChrange(date: value),
                validator: (value) => value.isNotEmpty ? null : "Favor digitar uma Data",
                keyboardType: TextInputType.datetime,
                inputFormatters: [
                  MaskedInputFormatter('00/00/0000')
                ],
              ),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 20,
              ),
              AnimatedBuilder(
                animation: controller, 
                builder: (_, __) => controller.state.when(
                  loading: () => CircularProgressIndicator(),
                  error: (message, _) => Text(message),
                  orElse: () => Button(
                    label: "Adicionar", 
                    onPressed: () {
                      controller.create();
                    },
                    type: ButtonType.fill,
                  )
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}