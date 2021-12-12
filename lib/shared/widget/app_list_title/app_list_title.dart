import 'package:flutter/material.dart';
import 'package:flutter_race1/shared/models/orders_model.dart';
import 'package:flutter_race1/shared/theme/app_theme.dart';

class AppListTitle extends StatelessWidget {
  final OrderModel orders;
  const AppListTitle({
    Key? key,
    required this.orders
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.colors.textEnabled,
          borderRadius: BorderRadius.circular(12)
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: AppTheme.colors.background,
            radius: 30,
            child: Text(orders.created.split("-").sublist(1).reversed.join("/"), 
            style: TextStyle(color: Colors.black),),
          ),
          title: Text("${orders.name}", style: AppTheme.textStyles.titleListTile,),
          subtitle: Text("R\$ ${orders.price.toStringAsFixed(2)}", style: AppTheme.textStyles.subtitle,),
          trailing: PopupMenuButton(
            itemBuilder: (context)=>[
              PopupMenuItem(child: Text("Editar"),),
              PopupMenuItem(child: Text("Excluir"),),
            ],
          ),
        ),
      ),
    );
  }
}