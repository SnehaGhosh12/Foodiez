import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodiez/utils/colors.dart';
import 'package:foodiez/utils/dimensions.dart';
import 'package:foodiez/widgets/big_text.dart';
import 'package:foodiez/widgets/icon_and_text.dart';
import 'package:foodiez/widgets/small_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  AppColumn({Key? key,
  required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text,size: Dimensions.font30,),
        SizedBox(height: Dimensions.height5,),
        Row(
          children: [
            Wrap(
              children: List.generate(5, (index) {return Icon(Icons.star,color: AppColors.mainColor,size: 15,);}),
            ),
            SizedBox(width: 10,),
            SmallText(text: "4.5"),
            SizedBox(width: 10,),
            SmallText(text: "1287"),
            SizedBox(width: 10,),
            SmallText(text: "comments"),
          ],
        ),
        SizedBox(height: Dimensions.height15,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndText(icon: Icons.circle_sharp, text: "Normal", iconColor: AppColors.iconColor1),
            IconAndText(icon: Icons.location_on, text: "1.5km", iconColor: AppColors.mainColor),
            IconAndText(icon: Icons.access_time_rounded, text: "30min", iconColor: AppColors.iconColor2),
          ],
        )
      ],
    );
  }
}
