import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mohemti/core/models/taskmodel.dart';
import 'package:mohemti/core/theme/colors.dart';
import 'package:mohemti/core/theme/text_style.dart';

class TaskInHomeView extends StatelessWidget {
  const TaskInHomeView({super.key, required this.task, });
  final Taskmodel task;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.w),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 5.h,
        children: [
          Row(
            spacing: 7.w,
            children: [
              Text(
              task.ranking.toString(),
                style: AppTextStyles.weight400size16,
              ),
              ImageIcon(AssetImage('Assets/icons/alarm-clock.png')),
              ImageIcon(AssetImage('Assets/icons/repeat 2.png')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                task.title!,
                style: AppTextStyles.weight700size24black,
              ),
              Icon(Icons.circle_outlined),
            ],
          ),
          Text(
  '${task.time!.hour.toString().padLeft(2, '0')}:${task.time!.minute.toString().padLeft(2, '0')}',
  style: AppTextStyles.weight400size16
      .copyWith(color: appcolors.secondaryColor),
),

        ],
      ),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
      ),
    );
  }
}
