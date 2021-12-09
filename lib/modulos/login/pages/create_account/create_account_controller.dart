import 'package:flutter/material.dart';
import 'package:flutter_race1/modulos/login/repositories/login_repository.dart';
import 'package:flutter_race1/shared/models/user_model.dart';
import 'package:flutter_race1/shared/services/app_database.dart';
import 'package:flutter_race1/shared/utils/app_state.dart';

class CreateAccountController extends ChangeNotifier{
  final LoginRepository repository;
  AppState state = AppState.empty();

  final formkey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String _name = "";

  CreateAccountController({
    required this.repository
  });

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
        final response = await repository.createAccount(
          email: _email, 
          name: _name, 
          password: _password
        );
        update(AppState.success<UserModel>(response));

      } catch (e) {
        update(AppState.error(e.toString()));
      }
    }
  }
}