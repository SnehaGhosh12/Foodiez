import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodiez/utils/colors.dart';
import 'package:foodiez/utils/dimensions.dart';
import 'package:foodiez/widgets/app_column.dart';
import 'package:foodiez/widgets/app_icon.dart';
import 'package:foodiez/widgets/big_text.dart';
import 'package:foodiez/widgets/expandable_text.dart';
import 'package:foodiez/widgets/icon_and_text.dart';
import 'package:foodiez/widgets/small_text.dart';

class PopularFoodDetails extends StatelessWidget {
  const PopularFoodDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
          Positioned(
            left: 0,
            right: 0,
            child:Container(
              width: double.maxFinite,
                height: Dimensions.foodDetailsImgSize,
                decoration:BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/img_9.png"),
                      fit: BoxFit.cover
                  ),
                )
            )
          ),

          //icons
          Positioned(
              top: Dimensions.height30,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(icon: Icons.arrow_back_ios,size: Dimensions.iconSize35,),
                  AppIcon(icon: Icons.shopping_cart_outlined,size: Dimensions.iconSize35,)
                ],
              )
          ),

          //introduction and body
          Positioned(
              top: Dimensions.foodDetailsImgSize-30,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,top: Dimensions.height20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius30),
                    topLeft: Radius.circular(Dimensions.radius30),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(text: "Chinese Side"),
                    SizedBox(height: Dimensions.height20,),
                    BigText(text: "Introduce",size: Dimensions.font20,),
                    //expandable text
                  ExpandableText(
                                text: "Chilli Chicken is a sweet, spicy and crispy appetizer, most popular in Indo-chinese cuisine.jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjooooooooooooooooooooooooooooooooooooooooooooooojikmmmmmmmmmmmmmmmmmmmmmmmmmiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"),

                  ],
                ),
              ),
          ),

          

        ],
      ),

      bottomNavigationBar: Container(
        height: Dimensions.bottomNavigationheight,
        padding: EdgeInsets.only(top: Dimensions.height5,bottom: Dimensions.height5,left: Dimensions.width10,right: Dimensions.width10),
        decoration: BoxDecoration(
          color: AppColors.buttonBackGroundColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(Dimensions.radius20),
            topLeft: Radius.circular(Dimensions.radius20),
          )
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: Dimensions.width10,),
              padding: EdgeInsets.only(top:Dimensions.height15,bottom: Dimensions.height15,left: Dimensions.width20,right: Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius10),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Icon(Icons.remove,color: AppColors.mainColor,),
                  SizedBox(width: Dimensions.width10,),
                  BigText(text: "0",size: 25,),
                  SizedBox(width: Dimensions.width10,),
                  Icon(Icons.add,color: AppColors.mainColor,),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: Dimensions.width10),
              padding: EdgeInsets.only(top:Dimensions.height15,bottom: Dimensions.height15,left: Dimensions.width10,right: Dimensions.width10),
              child: BigText(text : "\$10 | Add to cart",color: Colors.white,size: 25,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius10),
                color: AppColors.mainColor,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
