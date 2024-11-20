import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
