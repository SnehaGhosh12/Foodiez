import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodiez/utils/colors.dart';
import 'package:foodiez/utils/dimensions.dart';
import 'package:foodiez/widgets/small_text.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  ExpandableText({Key? key,
  required this.text}) : super(key: key);

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText=true;

  double textHeight= Dimensions.screenHeight/5.63;

  @override
  void initState(){
    super.initState();
    if(widget.text.length>textHeight){
      firstHalf= widget.text.substring(0,textHeight.toInt());
      secondHalf= widget.text.substring(textHeight.toInt()+1, widget.text.length);
   }
    else{
      firstHalf= widget.text;
      secondHalf= "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty? SmallText(text: firstHalf):Column(
        children: [
          SmallText(text: hiddenText?(firstHalf+"..."):(firstHalf+secondHalf)),
          InkWell(
            onTap: (){
              setState(() {
                hiddenText=!hiddenText;
              });
            },
            child: Row(
              children: [
                SmallText(text: hiddenText?"Show more":"Show less",color: AppColors.mainColor,),
                Icon(Icons.arrow_drop_down, color: AppColors.mainColor,),
              ],
            ),
          )
        ],
      ),

    );
  }
}
