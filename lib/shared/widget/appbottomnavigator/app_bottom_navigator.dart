import 'package:flutter/material.dart';
import 'package:flutter_race1/shared/theme/app_theme.dart';

class AppBottomNavigator extends StatelessWidget {
  const AppBottomNavigator({
    Key? key,
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
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppTheme.colors.primary,
                borderRadius: BorderRadius.circular(12)
              ),
              child: Icon(
                Icons.home,
                color: AppTheme.colors.textEnabled,
              ),
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppTheme.colors.background,
                borderRadius: BorderRadius.circular(12)
              ),
              child: Icon(
                Icons.add,
                color: AppTheme.colors.iconInactive,
              ),
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppTheme.colors.background,
                borderRadius: BorderRadius.circular(12)
              ),
              child: Icon(
                Icons.settings_rounded,
                color: AppTheme.colors.iconInactive,
              ),
            ),
          ],
        ),
      ),
    );
  }
}