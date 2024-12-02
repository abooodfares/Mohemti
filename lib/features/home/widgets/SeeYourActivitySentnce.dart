import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mohemti/core/theme/text_style.dart';

class SeeYourActivitySentnce extends StatelessWidget {
  const SeeYourActivitySentnce({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
              padding:EdgeInsets.only(right:  10.0.w),
              child: Wrap(direction: Axis.vertical, children: [
                Text(
                  'نظرة عامة على ',
                  style: AppTextStyles.weight700size24black,
                ),
                Text('أنشطتك', style: AppTextStyles.weight700size24black),
              ]),
            );
  }
}