import 'package:flutter/cupertino.dart';
import 'package:foodiez/widgets/small_text.dart';

class IconAndText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  const IconAndText({Key? key,
    required this.icon,
    required this.text,
    required this.iconColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,color: iconColor,),
        SizedBox(width: 2,),
        SmallText(text: text),
        // SizedBox(width: 15,)
      ],
    );
  }
}
