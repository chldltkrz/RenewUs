import 'package:flutter/material.dart';
import 'package:renewus/themes/app_themes.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function()? onTap;

  const CustomListTile({
    Key? key,
    required this.title,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: 24.0,
                  color: AppTheme.primaryColor.withOpacity(0.95),
                ), // AppTheme에서 색상 참조
                SizedBox(width: 16),
                Text(
                  title,
                  style: AppTheme
                      .lightTheme.textTheme.bodyLarge, // AppTheme에서 텍스트 스타일 참조
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color:
                  AppTheme.primaryColor.withOpacity(0.85), // AppTheme에서 색상 참조
            ),
          ],
        ),
      ),
    );
  }
}
