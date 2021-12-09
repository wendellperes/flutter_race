import 'package:flutter/material.dart';
import 'package:flutter_race1/shared/models/user_model.dart';
import 'package:flutter_race1/shared/theme/app_colors.dart';
import 'package:flutter_race1/shared/theme/app_theme.dart';
import 'package:flutter_race1/shared/widget/app_list_title/app_list_title.dart';
import 'package:flutter_race1/shared/widget/appbottomnavigator/app_bottom_navigator.dart';
import 'package:flutter_race1/shared/widget/card_product/card_product.dart';

class HomePage extends StatefulWidget {
  final UserModel user;
  const HomePage({ 
    Key? key, 
    required this.user 
    }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;
  void changeIndex(int index){
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 126,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => CardProduct()
                ),
              ),
              AppListTitle(),
              AppListTitle(),
              AppListTitle()
            ]
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
    );
  }
}



