import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mohemti/core/helper/my_padding_ex.dart';
import 'package:mohemti/core/helper/sizedbox%20extention.dart';
import 'package:mohemti/core/theme/text_style.dart';

class MyAppButton extends StatelessWidget {
  const MyAppButton({super.key, required this.onPressed, required this.mytext});
  final void Function() onPressed;
  final String mytext;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(343.w, 50.h),
          backgroundColor: Color(0xFF7660CF),
        ),
        onPressed: onPressed,
        child: Text(
          mytext,
          style: AppTextStyles.weight400size16.copyWith(
            color: Color(0xffffffffff),
          ),
        ));
  }
}

class Loginbuttonwith extends StatelessWidget {
  const Loginbuttonwith(
      {super.key,
      required this.onPressed,
      required this.mytext,
      required this.color,
      required this.icon, required this.isblacktext});

  final void Function() onPressed;
  final String mytext;
  final int color;
  final Widget icon;
  final bool isblacktext;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: symmetricHorizontalPadding(12),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(343.w, 50.h),
            backgroundColor: Color(color),
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                mytext,
                style: AppTextStyles.weight400size16.copyWith(
                  color: isblacktext ? Colors.black : Color(0xffffffffff),
                ),
              ),
              horizontalSpace(5),
              icon
            ],
          )),
    );
  }
}
