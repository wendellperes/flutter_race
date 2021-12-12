import 'package:flutter/material.dart';
import 'package:flutter_race1/modulos/feed/feed_controller.dart';
import 'package:flutter_race1/modulos/feed/repositories/feed_repository_impl.dart';
import 'package:flutter_race1/shared/models/orders_model.dart';
import 'package:flutter_race1/shared/services/app_database.dart';
import 'package:flutter_race1/shared/theme/app_text.dart';
import 'package:flutter_race1/shared/widget/app_list_title/app_list_title.dart';
import 'package:flutter_race1/shared/widget/card_chart/card_chart.dart';
import 'package:flutter_race1/shared/widget/card_product/card_product.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({ Key? key }) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  late final FeedController controller;


 @override
  void initState() {
    controller = FeedController(repository: FeedRepositoryImpl(database: AppDatabase.instance));
    controller.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
              top: true,
              bottom: false,
              child: SingleChildScrollView(
                child: AnimatedBuilder(
                  animation: controller, 
                  builder: (_, __) => controller.state.when(
                    success: (value){
                      final orders = value as List<OrderModel>;
                      final products = controller.products;
                      return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CardChart(
                                      value: controller.sumTotal,
                                      percent: controller.calChart(products),
                                  ),
                                  SizedBox(
                                    height: 27,
                                  ),
                                  Text("Preço dos produtos").label,
                                  SizedBox(
                                    height: 14,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 126,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: products.length,
                                itemBuilder: (context, index) => 
                                CardProduct(
                                  product: products[index]
                                )
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 27,
                                  ),
                                  Text("Suas últimas compras").label,
                                  SizedBox(
                                    height: 14,
                                  ),
                                  for ( var order in orders)
                                  AppListTitle(orders: order,),
                                  
                                ],
                              ),
                            )
                          ]
                        );
                    },
                    orElse: ()=>Container()
                    )
                )
              ),
            );
  }
}