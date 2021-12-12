import 'package:flutter/material.dart';
import 'package:flutter_race1/shared/theme/app_theme.dart';
import 'package:flutter_race1/shared/widget/chart_horizontal/chart_hotizontal.dart';

class CardChart extends StatelessWidget {
  final double value;
  final double percent; 
  const CardChart({ Key? key, required this.value, required this.percent }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 218,
      decoration: BoxDecoration(
        color: AppTheme.colors.textEnabled,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Gasto Mensal").label,
            SizedBox(
              height: 18,
            ),
            Text.rich(
              TextSpan(
                text: "R\$ ",
                style: AppTheme.textStyles.titleListTile,
                children: [
                  TextSpan(
                    text: value.toStringAsFixed(2).replaceAll(".", ","),
                    style: AppTheme.textStyles.titleListTile.copyWith(fontSize: 36)
                  )
                ]
              )
            ),
            SizedBox(
              height: 10,
            ),
            ChartHorizontal( percent: percent,)
          ],
        ),
      ),
      
    );
  }
}