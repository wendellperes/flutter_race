import 'package:flutter/material.dart';
import 'package:flutter_race1/modulos/create/create_bottomsheet.dart';
import 'package:flutter_race1/modulos/feed/feed-page.dart';
import 'package:flutter_race1/shared/models/user_model.dart';
import 'package:flutter_race1/shared/theme/app_colors.dart';
import 'package:flutter_race1/shared/theme/app_theme.dart';
import 'package:flutter_race1/shared/widget/app_list_title/app_list_title.dart';
import 'package:flutter_race1/shared/widget/appbottomnavigator/app_bottom_navigator.dart';
import 'package:flutter_race1/shared/widget/card_chart/card_chart.dart';
import 'package:flutter_race1/shared/widget/card_product/card_product.dart';

class HomePage extends StatefulWidget {
  final UserModel user;
  final List<Widget> pages;
  const HomePage({ 
    Key? key, 
    required this.user, required this.pages 
    }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;
  late final List<Widget> pages = widget.pages;
  void changeIndex(int index) async {
    if (index == 3){
      await showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32)
          )
        ),
        context: context, 
        builder: (context)=> CreateBottomsheet()
        );
    }else{
      currentIndex = index;
      
    }
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              key: UniqueKey(),
              child: List.from(pages)[currentIndex],
            ),
            Positioned(
              right: 26,
              left: 26,
              bottom: 14,
              child: AppBottomNavigator(
                currentIndex: currentIndex, 
                onChanged: changeIndex,
              ),
            )
        ],
        ),
      ),
    );
  }
}



