import 'package:flutter/material.dart';
import 'package:flutter_race1/modulos/create/repositories/create_repository.dart';
import 'package:flutter_race1/shared/utils/app_state.dart';

class CreateController extends ChangeNotifier{
  final ICreateRepository repository;
  AppState state = AppState.empty();

  final formkey = GlobalKey<FormState>();
  String _name = '';
  String _price= '';
  String _date = "";

  CreateController({required this.repository});

  void onChrange ({String? name, String? price, String? date}){
    _name = name ?? _name;
    _price = price?? _price;
    _date = date?? _date;


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
  Future<void> create() async{
    if(validate()){
      try {
        update(AppState.loading());
        final response = await repository.create(
          date: _date, 
          name: _name, 
          price: _price
        );
        if (response){
          update(AppState.success<bool>(response));
        }else{
          throw Exception("Não foi possível cadastrar");
        }

      } catch (e) {
        update(AppState.error(e.toString()));
      }
    }
  }
}