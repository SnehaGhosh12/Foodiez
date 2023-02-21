import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodiez/utils/colors.dart';
import 'package:foodiez/utils/dimensions.dart';
import 'package:foodiez/widgets/app_column.dart';
import 'package:foodiez/widgets/big_text.dart';
import 'package:foodiez/widgets/icon_and_text.dart';
import 'package:foodiez/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController =PageController(viewportFraction: 0.9);
  var currPageValue = 0.0;
  var scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
      setState(() {
        currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose(){
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        //slider section
        Container(
          height: Dimensions.pageView,
          margin: EdgeInsets.only(top:5),
          // color: Colors.blue,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context,position){
                return PageItemBuilder(position);
              }
          ),
        ),

        //dots section
        new DotsIndicator(
        dotsCount: 5,
        position: currPageValue,
        decorator: DotsDecorator(
          size: const Size.square(9.0),
          activeSize: const Size(18.0, 9.0),
          activeColor: Colors.greenAccent,
          activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
    ),
    ),

        //Popular Section
        SizedBox(height: Dimensions.height5),
        Container(
          margin: EdgeInsets.only(left:Dimensions.width30),
          child:Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular"),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: BigText(text: ".",color:Colors.black45),
              ),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: SmallText(text: "Food Pairing"),
              ),
            ],
          )

        ),

        //list of Food
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context,index){
                return Container(
                  margin: EdgeInsets.only(left: Dimensions.width20,right:Dimensions.width20,bottom: Dimensions.height10),
                  child: Row(
                    children: [

                      //image section
                      Container(
                          width: Dimensions.imgviewSize,
                          height: Dimensions.imgviewSize,
                          decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          image: DecorationImage(
                              image: AssetImage('assets/images/img_8.png'),
                              fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      //text section
                      Expanded(
                        child: Container(
                          height: Dimensions.listViewContainerSize,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                              color: AppColors.shadowColor,
                              blurRadius: 1,
                              offset: Offset(2,0)
                            )],
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20)
                            ),
                          ),

                          child: Padding(padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BigText(text: "Delicious food meal in India"),
                                SizedBox(height: Dimensions.height5,),
                                SmallText(text: "The auspicious Indian flavours"),
                                SizedBox(height: Dimensions.height15,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconAndText(icon: Icons.circle_sharp, text: "Normal", iconColor: Colors.orangeAccent),
                                    IconAndText(icon: Icons.location_on, text: "1.5km", iconColor: Colors.greenAccent),
                                    IconAndText(icon: Icons.access_time_rounded, text: "30min", iconColor: Colors.orange),
                                  ],
                                ),

                              ],
                             ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }),

      ],
    );
  }

  Widget PageItemBuilder(int position) {
    Matrix4 matrix = Matrix4.identity();
    if(position == currPageValue.floor()){
      var currScale = 1-(currPageValue-position)*(1-scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    }
    else if(position == currPageValue.floor()+1){
      var currScale = scaleFactor+(currPageValue-position+1)*(1-scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    }
    else if(position == currPageValue.floor()-1){
      var currScale =  1-(currPageValue-position)*(1-scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    }
    else{
      var currScale=0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-scaleFactor)/2, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(left: 10,right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/img_9.png'),
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child:Container(
                height: Dimensions.pageViewTextContainer,
                margin: EdgeInsets.only(left: 35,right: 35,bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadowColor,
                      blurRadius: 10.0,
                      offset: Offset(0, 5)
                    ),
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(-5, 0)
                    ),
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(5, 0)
                    ),

                  ]
                ),
                child: Container(
                  padding: EdgeInsets.only(top: 15,left: 15,right: 15),
                  child: AppColumn(text: "Chinese Side"),
                ),
              )

          )
        ],

      ),
    );
  }
}

