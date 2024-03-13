import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    this.text,
    this.enable = true,
    this.onTap,
    this.width,
    this.height,
    Key? key,
  }) : super(key: key);

  final String? text;
  final Function()? onTap;
  final double? width;
  final bool? enable;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50,
      width: width ?? null,
      child: TextButton(
          onPressed: enable == true ? onTap : null,
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0))),
              backgroundColor:(enable != false) ? MaterialStateProperty.all<Color>(Colors.blue) : MaterialStateProperty.all<Color>(Colors.grey)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text ?? '',
              style: const TextStyle(color: Colors.white),
            ),
          )),
    );
  }
}
