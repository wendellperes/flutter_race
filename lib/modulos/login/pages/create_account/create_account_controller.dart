import 'package:flutter/material.dart';
import 'package:flutter_race1/shared/utils/app_state.dart';

class CreateAccountController extends ChangeNotifier{
  AppState state = AppState.empty();

  final formkey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String _name = "";

  void onChrange ({String? email, String? password, String? name}){
    _email = email ?? _email;
    _password = password?? _password;
    _name = name?? _name;


  }
  bool validate(){
    final form = formkey.currentState!;
    if (form.validate()){
      form.save();
      return true;
    }
    return false;
  }
  void update (AppState state){
    this.state = state ;
    notifyListeners();
  }
  Future<void> createAccount() async{
    if(validate()){
      try {
        update(AppState.loading());
        await Future.delayed(Duration(seconds: 4));
        update(AppState.success<String>("Deu Certo"));

      } catch (e) {
        update(AppState.error("Não foi possivel criar contar"));
      }
    }
  }
}