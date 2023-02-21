
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodiez/Pages/home/food_page_body.dart';
import 'package:foodiez/widgets/big_text.dart';
import 'package:foodiez/widgets/small_text.dart';


class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    // print(MediaQuery. of(context). size. width);//411
    // print(MediaQuery. of(context). size. height);//731,683
    return Scaffold(
      body: Container(
        child:
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 7,left: 10,right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BigText(color: Colors.greenAccent, text: "India"),
                            Row(
                              children: [
                                SmallText(color: Colors.black45,text: "Kolkata",),
                                Icon(Icons.arrow_drop_down)
                              ],
                            ),
                          ],
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11),
                            color: Colors.greenAccent,
                          ),
                          child: Icon(Icons.search,color: Colors.white,),
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: SingleChildScrollView(
                    child: FoodPageBody(),
                  )),
                ],
              ),
            ),
          ),
      )
    );
  }
}
