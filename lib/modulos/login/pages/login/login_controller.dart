import 'package:flutter/material.dart';
import 'package:flutter_race1/shared/utils/app_state.dart';

class LoginController extends ChangeNotifier{

    AppState state = AppState.empty();

  final formkey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  void onChrange ({String? email, String? password}){
    _email = email ?? _email;
    _password = password?? _password;

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
    this.state = state;
    notifyListeners();
  }
  Future<void> login() async {
    if(validate()){
      try {
        update(AppState.loading());
        //chama back end
        await Future.delayed(Duration(seconds: 4));
        //update(AppState.error("Não foi possível realizar login"));
        update(AppState.success<String>("Usuario logado"));
      } catch (e){
        update(AppState.error("Não foi possível realizar login"));
      }
    }
  }
}