import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mohemti/core/helper/date_and_time_format.dart';
import 'package:mohemti/core/helper/route_extention.dart';
import 'package:mohemti/core/helper/sizedbox%20extention.dart';
import 'package:mohemti/core/models/taskmodel.dart';
import 'package:mohemti/core/theme/text_style.dart';

import 'package:mohemti/core/widgets/bottomssheets/category_bottomsheet.dart';
import 'package:mohemti/core/widgets/bottomssheets/my_bottomsheet.dart';
import 'package:mohemti/core/widgets/bottomssheets/ranking_bottomsheet.dart';
import 'package:mohemti/core/widgets/bottomssheets/remidner_bottomsheet.dart';
import 'package:mohemti/core/widgets/bottomssheets/tecrar_bottomsheet.dart';
import 'package:mohemti/core/widgets/my_app_button.dart';
import 'package:mohemti/core/widgets/my_app_textfield.dart';
import 'package:mohemti/features/home/cubit/cubit/task_cubit.dart';
import 'package:mohemti/features/home/cubit/home_cubit.dart';
import 'package:mohemti/features/home/widgets/TaskDataContainor.dart';

class TaskDetails extends StatefulWidget {
  const TaskDetails({super.key, required this.task, required this.index});
  final Taskmodel task;
  final int index;

  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  TimeOfDay _selectedTime = TimeOfDay.now();
  static const Map<int, String> rankingDescriptions = {
    1: 'أولوية عالية',
    2: 'أولوية متوسطة',
    3: 'أولوية منخفضة',
    4: 'لا توجد أولوية',
  };

  String formattedDate = DateAndTimeFormat.dateAndTimeFormat(DateTime.now());
  TextEditingController controller = TextEditingController();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
        context.read<TaskCubit>().changeTime(_selectedTime);
      });
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    controller.text = widget.task.title!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var task = context.watch<TaskCubit>();
    var homeCubit = context.read<HomeCubit>();
    return Scaffold(
        appBar: AppBar(
          title: Text('تفاصيل المهمة'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'إضافة مهام جديدة',
                    style: AppTextStyles.weight500size20black,
                  ),
                  MyTextField(
                      controller: controller, labelText: 'ماذا تريد ان تفعل؟'),
                  verticalSpace(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TaskDataContainer(
                        FirstText: 'التاريخ',
                        SecText: formattedDate,
                        imgSrc:
                            'Assets/icons/calendar-2 1.png', // Replace with your custom icon if needed
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2200),
                          );
                          if (pickedDate != null) {
                            setState(() {
                              formattedDate =
                                  DateAndTimeFormat.dateAndTimeFormat(pickedDate);
                            });
                            task.state.date = pickedDate;
                          }
                        },
                      ),
                      TaskDataContainer(
                        FirstText: 'الوقت',
                        SecText: '${_selectedTime.format(context)}',
                        imgSrc: 'Assets/icons/clock 1.png',
                        // Replace with your custom icon if needed
                        onTap: () => _selectTime(context),
                      ),
                    ],
                  ),
                  verticalSpace(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TaskDataContainer(
                        FirstText: 'تكرار',
                        SecText: task.state.dayrepeat!,
              
                        imgSrc:
                            'Assets/icons/repeat 2.png', // Replace with your custom icon if needed
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => MyBottomSheet(
                              child: BlocProvider.value(
                                  value: task, child: Tecrar_Bottomsheet()),
                            ),
                          );
              
                          // Action for تكرار
                        },
                      ),
                      TaskDataContainer(
                        FirstText: 'تذكير',
                        SecText: task.state.reminder.toString(),
                        imgSrc:
                            'Assets/icons/alarm-clock.png', // Replace with your custom icon if needed
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => MyBottomSheet(
                                    child: BlocProvider.value(
                                        value: task, child: Remidner_Bottomsheet()),
                                  ));
                        },
                      ),
                    ],
                  ),
                  verticalSpace(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TaskDataContainer(
                        FirstText: 'الأولوية',
                        SecText: rankingDescriptions[task.state.ranking]!,
                        imgSrc: 'Assets/icons/flag 2.png',
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => MyBottomSheet(
                                    child: BlocProvider.value(
                                        value: task, child: RankingBotttomsheeet()),
                                  ));
                        },
                      ),
                      TaskDataContainer(
                        FirstText: 'القسم',
                        SecText: task.state.category!,
                        imgSrc:
                            'Assets/icons/element-equal.png', // Replace with your custom icon if needed
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => MyBottomSheet(
                                    child: BlocProvider.value(
                                      value: task,
                                      child: CategoryBottomSheet(),
                                    ),
                                  ));
                        },
                      ),
                    ],
                  ),
                  verticalSpace(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TaskChoice(imgSrc: 'Assets/imgs/delete-02.png', color: Colors.red.withOpacity(0.2),),
                      horizontalSpace(10),
                      TaskChoice(imgSrc: 'Assets/imgs/user-cirlce-add 1 (1).png', color: Colors.green.withOpacity(0.2),),
                    ],
                  ),
                  
                
                ],
              ),
                MyAppButton(
                onPressed: () {
                  task.state.title = controller.text;
                  homeCubit.updateTask(task.state, widget.index);
              
                  context.pop();
                },
                mytext: 'حفظ',
              ),
            ],
          ),
        ));
  }
}

class TaskChoice extends StatelessWidget {
  const TaskChoice({super.key, required this.imgSrc, required this.color});
  final String imgSrc;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 156.w,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      alignment: Alignment.center,
      child: Image(
        image: AssetImage(
          imgSrc,
        ),
        width: 22.w,
        height: 22.h,
      ),
    );
  }
}
