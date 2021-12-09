import 'package:flutter/material.dart';
import 'package:flutter_race1/shared/models/user_model.dart';
import 'package:flutter_race1/shared/theme/app_colors.dart';
import 'package:flutter_race1/shared/theme/app_theme.dart';
import 'package:flutter_race1/shared/widget/appbottomnavigator/app_bottom_navigator.dart';

class HomePage extends StatelessWidget {
  // final UserModel user;
  const HomePage({ 
    Key? key, 
    // required this.user 
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      body: Stack(
        children: [
          Positioned(
            right: 26,
            left: 26,
            bottom: 14,
            child: AppBottomNavigator(),
          )
      ],
      ),
    );
  }
}

