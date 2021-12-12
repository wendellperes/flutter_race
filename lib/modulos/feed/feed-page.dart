import 'package:flutter/material.dart';
import 'package:flutter_race1/modulos/feed/feed_controller.dart';
import 'package:flutter_race1/modulos/feed/repositories/feed_repository_impl.dart';
import 'package:flutter_race1/shared/models/orders_model.dart';
import 'package:flutter_race1/shared/models/product_model.dart';
import 'package:flutter_race1/shared/services/app_database.dart';
import 'package:flutter_race1/shared/theme/app_text.dart';
import 'package:flutter_race1/shared/theme/app_theme.dart';
import 'package:flutter_race1/shared/widget/app_list_title/app_list_title.dart';
import 'package:flutter_race1/shared/widget/card_chart/card_chart.dart';
import 'package:flutter_race1/shared/widget/card_product/card_product.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shimmer/shimmer.dart';

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
                    loading: (){
                      return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Shimmer.fromColors(
                                    child: Container(
                                      width: double.maxFinite,
                                      height: 218,
                                      color: Colors.grey[300],
                                    ), 
                                    baseColor: Colors.grey[300]!, 
                                    highlightColor: Colors.grey[100]!
                                  ),
                                  SizedBox(
                                    height: 27,
                                  ),
                                   Shimmer.fromColors( 
                                    baseColor: Colors.grey[300]!, 
                                    highlightColor: Colors.grey[100]!,
                                    child: Container(
                                            width: 160,
                                            height: 30,
                                            color: Colors.grey[300],
                                        ),
                                  ),
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
                                itemBuilder: (context, index) => 
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 230,
                                    decoration: BoxDecoration(
                                      color: AppTheme.colors.textEnabled,
                                      borderRadius: BorderRadius.circular(12)
                                    ),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          leading: Shimmer.fromColors(
                                            child: CircleAvatar(
                                            backgroundColor: Colors.grey[300],
                                            radius: 30,
                                            ), 
                                            baseColor: Colors.grey[300]!, 
                                            highlightColor: Colors.grey[100]!,
                                          ),


                                          
                                          title: Shimmer.fromColors(
                                              child: Container(
                                                width: 160,
                                                height: 20,
                                                color: Colors.grey[300],
                                              ), 
                                            baseColor: Colors.grey[300]!, 
                                            highlightColor: Colors.grey[100]!,
                                          ),
                                           
                                          subtitle: Shimmer.fromColors(
                                              child: Container(
                                                width: 160,
                                                height: 15,
                                                color: Colors.grey[300],
                                              ), 
                                            baseColor: Colors.grey[300]!, 
                                            highlightColor: Colors.grey[100]!,
                                          ),
                                        ),
                                        Shimmer.fromColors(
                                              child: Container(
                                                width: 160,
                                                height: 25,
                                                color: Colors.grey[300],
                                              ), 
                                            baseColor: Colors.grey[300]!, 
                                            highlightColor: Colors.grey[100]!,
                                          ),
                                      ],
                                    ),
                                  ),
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
                                  Shimmer.fromColors(
                                    child: Container(
                                            width: 160,
                                            height: 30,
                                            color: Colors.grey[300],
                                        ), 
                                    baseColor: Colors.grey[300]!, 
                                    highlightColor: Colors.grey[100]!
                                  ),
                                  
                                  SizedBox(
                                    height: 14,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: AppTheme.colors.textEnabled,
                                        borderRadius: BorderRadius.circular(12)
                                      ),
                                      child: ListTile(
                                        leading: Shimmer.fromColors(
                                            child: CircleAvatar(
                                            backgroundColor: Colors.grey[300],
                                            radius: 30,
                                            ), 
                                            baseColor: Colors.grey[300]!, 
                                            highlightColor: Colors.grey[100]!,
                                          ),
                                        title: Shimmer.fromColors(
                                              child: Container(
                                                width: 160,
                                                height: 20,
                                                color: Colors.grey[300],
                                              ), 
                                            baseColor: Colors.grey[300]!, 
                                            highlightColor: Colors.grey[100]!,
                                          ),
                                        subtitle: Shimmer.fromColors(
                                              child: Container(
                                                width: 160,
                                                height: 15,
                                                color: Colors.grey[300],
                                              ), 
                                            baseColor: Colors.grey[300]!, 
                                            highlightColor: Colors.grey[100]!,
                                          ),
                                        trailing: Shimmer.fromColors(
                                              child: Container(
                                                width: 20,
                                                height: 25,
                                                color: Colors.grey[300],
                                              ), 
                                            baseColor: Colors.grey[300]!, 
                                            highlightColor: Colors.grey[100]!,
                                          ),
                                      ),
                                    ),
                                  )
                                  
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