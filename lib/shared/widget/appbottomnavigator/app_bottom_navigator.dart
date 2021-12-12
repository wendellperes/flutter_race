import 'package:flutter/material.dart';
import 'package:flutter_race1/shared/theme/app_theme.dart';

class AppBottomNavigator extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onChanged;
  const AppBottomNavigator({
    Key? key, required this.currentIndex, required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 26, right: 26, bottom: 14),
      child: Container(
        height: 76,
        decoration: BoxDecoration(
          color: AppTheme.colors.textEnabled,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButtomNavigator(
              icon: Icons.home,
              ontap: (){
                onChanged(0);
              },
              enabled: currentIndex == 0
            ),
            IconButtomNavigator(
              icon: Icons.add,
              ontap: (){
                onChanged(3);
              },
              enabled: false
            ),
            IconButtomNavigator(
              icon: Icons.settings,
              ontap: (){
                onChanged(1);
              },
              enabled: currentIndex == 1
            ),
            
            
          ],
        ),
      ),
    );
  }
}

class IconButtomNavigator extends StatelessWidget {
  final Function() ontap;
  final bool enabled;
  final IconData icon;

  const IconButtomNavigator({
    Key? key,
    required this.ontap,
    required this.enabled,
    required this.icon,
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: enabled
            ? AppTheme.colors.primary
            : AppTheme.colors.background,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Icon(
          icon,
          color: enabled
            ? AppTheme.colors.textEnabled
            : AppTheme.colors.iconInactive
        ),
      ),
    );
  }
}