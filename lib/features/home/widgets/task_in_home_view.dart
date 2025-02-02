import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mohemti/core/helper/my_padding_ex.dart';
import 'package:mohemti/core/helper/route_extention.dart';
import 'package:mohemti/core/helper/sizedbox%20extention.dart';
import 'package:mohemti/core/models/taskmodel.dart';
import 'package:mohemti/core/routes/approutes.dart';
import 'package:mohemti/core/theme/colors.dart';
import 'package:mohemti/core/theme/text_style.dart';
import 'package:mohemti/features/home/cubit/cubit/task_cubit.dart';
import 'package:mohemti/features/home/view/task_detalis.dart';

class TaskInHomeView extends StatelessWidget {
  const TaskInHomeView({
    super.key,
    required this.task,
    required this.index,
  });

  final Taskmodel task;
  final int index;

  // Map rankings to corresponding asset icons
  static const Map<int, String> rankingIcons = {
    1: 'Assets/icons/Priorities=High.png',
    2: 'Assets/icons/Priorities=Medium.png',
    3: 'Assets/icons/Priorities=Low.png',
    4: 'Assets/icons/Priorities=No.png',
  };

  @override
  Widget build(BuildContext context) {
    // var taskcubit = context.watch<TaskCubit>();

    return GestureDetector(
      onTap: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => BlocProvider.value(
        //       value: taskcubit,
        //       child: TaskDetails(task: task, index: index),
        //     ),
        //   ),
        // );
      },
      child: Container(
        margin: EdgeInsets.all(10.w),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 5.h,
          children: [
            Padding(
              padding: rightPadding(8),
              child: Row(
                spacing: 7.w,
                children: [
                  // Replace ranking with an image icon
                  if (rankingIcons.containsKey(task.ranking))
                    Image.asset(
                      rankingIcons[task.ranking]!,
                      height: 24.h,
                      width: 24.w,
                    )
                  else
                    Text(
                      task.ranking.toString(),
                      style: AppTextStyles.weight400size16,
                    ),
                  ImageIcon(AssetImage('Assets/icons/alarm-clock.png')),
                  ImageIcon(AssetImage('Assets/icons/repeat 2.png')),
                ],
              ),
            ),
            Padding(
              padding: symmetricHorizontalPadding(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    task.title!,
                    style: AppTextStyles.weight700size24black,
                  ),
                  Icon(Icons.circle_outlined),
                ],
              ),
            ),
            Padding(
              padding: allPadding(8),
              child: Row(
                children: [
                  Text(
                    'اليوم',
                    style: AppTextStyles.weight400size16.copyWith(
                        color: appcolors.secondaryColor, fontSize: 14.sp),
                  ),
                  horizontalSpace(5),
                  Text(
                    '${task.time!.hour.toString().padLeft(2, '0')}:${task.time!.minute.toString().padLeft(2, '0')}',
                    style: AppTextStyles.weight400size16.copyWith(
                        color: appcolors.secondaryColor, fontSize: 14.sp),
                  ),
                ],
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
        ),
      ),
    );
  }
}
