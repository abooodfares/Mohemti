import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mohemti/core/helper/sizedbox%20extention.dart';
import 'package:mohemti/core/theme/colors.dart';
import 'package:mohemti/core/theme/text_style.dart';

class HomeViewFirstRow extends StatelessWidget {
  const HomeViewFirstRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 11.w, top: 20.h, left: 10.w),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        //FISRT ROW IS TWO ROW WITHN ONE ROW THIS FIRST ROW I DO FOR RESPOVIVE
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: Color(0xFF7660CF),
            child: Text(
              'M',
              style: TextStyle(color: Colors.white),
            ),
          ),
          horizontalSpace(5),
          Column(
            children: [
              Text(
                'مرحبا محمد',
                style: AppTextStyles.weight400size16,
              ),
              Text(
                '15 اكتوبر 2024',
                style: AppTextStyles.weight400size16
                    .copyWith(color: Color(0xFF8D97A1)),
              )
            ],
          ),
        ]),
        //SEC ROW IN CODE
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: (appcolors.primaryColor),
            child: Image.asset('Assets/imgs/crown.png'),
          ),
          horizontalSpace(5),
          CircleAvatar(
            radius: 22,
            backgroundColor: (appcolors.primaryColor),
            child: Icon(Icons.notifications_none_outlined),
          )
        ])
      ]),
    );
  }
}