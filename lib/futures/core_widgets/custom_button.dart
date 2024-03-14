import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomButton extends StatelessWidget {
   CustomButton({
    this.text,
    this.enable = true,
    this.onTap,
    this.width,
    this.height,
    this.bold = false,
    this.fontSize = 14,
    Key? key,
  }) : super(key: key);

  final String? text;
  final Function()? onTap;
  final double? width;
  final bool? enable;
  final double? height;
  final double? fontSize;
  final bool? bold;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50,
      width: width ?? null,
      child: TextButton(


          onPressed: enable == true ? onTap : null,
          style: ButtonStyle(
              backgroundColor:enable == true ? MaterialStateProperty.all(Color(
                  0xFFB48B1F)) : MaterialStateProperty.all(Color(0xFF888686)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0))),
),
          child: Text(
            text ?? '',
            style:  TextStyle(color: Colors.white, fontSize: fontSize, fontWeight: bold == false ? FontWeight.normal : FontWeight.bold),
          )),
    );
  }
}
