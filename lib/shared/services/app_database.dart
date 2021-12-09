import 'package:flutter_race1/shared/models/user_model.dart';
import 'package:flutter_race1/shared/services/supabase_database.dart';

abstract class AppDatabase{
  static final AppDatabase instance = SupabaseDataBase();
  void init();
  Future<UserModel> createUser(UserModel user);
  Future<UserModel> getUser( String id);
  Future<UserModel> login({required String email, required String password});
  Future<UserModel> createAccount({
    required String email,
    required String password,
    required String name,
  });


}






