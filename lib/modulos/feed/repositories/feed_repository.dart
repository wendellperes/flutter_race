import 'package:flutter_race1/shared/models/orders_model.dart';

abstract class IFeedRepository{
  Future<List<OrderModel>> getAll();
}