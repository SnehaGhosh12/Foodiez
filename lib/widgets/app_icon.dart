import 'package:flutter/cupertino.dart';
import 'package:foodiez/utils/dimensions.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;

  AppIcon({Key? key,
  required this.icon,
    this.backgroundColor=const Color(0xd5ffffff),
    this.iconColor=const Color(0xff6c6351),
    this.size=40,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size/2),
        color: backgroundColor,
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: Dimensions.iconSize22,
      ),
    );
  }
}
