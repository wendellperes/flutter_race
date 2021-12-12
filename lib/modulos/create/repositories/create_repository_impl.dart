import 'package:flutter_race1/modulos/create/repositories/create_repository.dart';
import 'package:flutter_race1/shared/services/app_database.dart';

class CreateRepositoryImpl implements ICreateRepository{
  final AppDatabase database;

  CreateRepositoryImpl({
    required this.database
  });
  @override
  Future<bool> create({required String name, required String price, required String date}) async {
    final priceSanitize = double.parse(price.replaceAll("R\$", ""));
    final response = await database.create(table: "orders", data: {
      "name": name,
      "price": priceSanitize,
      "created": date
    });
    return response;
  }

}