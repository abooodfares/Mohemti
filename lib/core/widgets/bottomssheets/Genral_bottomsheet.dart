import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mohemti/core/helper/date_and_time_format.dart';
import 'package:mohemti/core/helper/my_padding_ex.dart';
import 'package:mohemti/core/helper/route_extention.dart';
import 'package:mohemti/core/helper/sizedbox%20extention.dart';
import 'package:mohemti/core/routes/approutes.dart';
import 'package:mohemti/core/theme/colors.dart';
import 'package:mohemti/core/theme/text_style.dart';
import 'package:mohemti/core/widgets/have_acount_already.dart';
import 'package:mohemti/core/widgets/my_app_button.dart';
import 'package:mohemti/core/widgets/my_app_textfield.dart';
import 'package:mohemti/features/home/cubit/cubit/task_cubit.dart';
import 'package:mohemti/features/home/cubit/home_cubit.dart';
import 'package:mohemti/features/home/widgets/TaskDataContainor.dart';
import 'package:mohemti/core/widgets/bottomssheets/category_bottomsheet.dart';
import 'package:mohemti/core/widgets/bottomssheets/my_bottomsheet.dart';
import 'package:mohemti/core/widgets/bottomssheets/ranking_bottomsheet.dart';
import 'package:mohemti/core/widgets/bottomssheets/remidner_bottomsheet.dart';
import 'package:mohemti/core/widgets/bottomssheets/tecrar_bottomsheet.dart';
import 'package:table_calendar/table_calendar.dart';

class Genral_bottomsheet extends StatefulWidget {
  const Genral_bottomsheet({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  State<Genral_bottomsheet> createState() => _Genral_bottomsheetState();
}

class _Genral_bottomsheetState extends State<Genral_bottomsheet> {
  TimeOfDay _selectedTime = TimeOfDay.now();
  String formattedDate =  DateAndTimeFormat.dateAndTimeFormat(DateTime.now());

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
  Widget build(BuildContext context) {
    var mybloc = context.watch<TaskCubit>();


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'إضافة مهام جديدة',
          style: AppTextStyles.weight500size20black,
        ),
        MyTextField(
            controller: widget.controller, labelText: 'ماذا تريد ان تفعل؟'),
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
                    mybloc.changeDate(pickedDate);
                  });
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
              SecText: mybloc.state.dayrepeat.toString(),
              imgSrc:
                  'Assets/icons/repeat 2.png', // Replace with your custom icon if needed
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => MyBottomSheet(
                          child: BlocProvider.value(
                            value: mybloc,
                            child: Tecrar_Bottomsheet(),
                          ),
                        ));

                // Action for تكرار
              },
            ),
            TaskDataContainer(
              FirstText: 'تذكير',
              SecText: mybloc.state.reminder.toString(),
              imgSrc:
                  'Assets/icons/alarm-clock.png', // Replace with your custom icon if needed
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => MyBottomSheet(
                          child: BlocProvider.value(
                            value: mybloc,
                            child: Remidner_Bottomsheet(),
                          ),
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
              SecText: mybloc.state.ranking.toString(),
              imgSrc: 'Assets/icons/flag 2.png',
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => MyBottomSheet(
                          child: BlocProvider.value(
                            value: mybloc,
                            child: RankingBotttomsheeet(),
                          ),
                        ));
              },
            ),
            TaskDataContainer(
              FirstText: 'القسم',
              SecText: mybloc.state.category ?? '',
              imgSrc:
                  'Assets/icons/element-equal.png', // Replace with your custom icon if needed
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => MyBottomSheet(
                          child: BlocProvider.value(
                            value: mybloc,
                            child: CategoryBottomSheet(),
                          ),
                        ));
              },
            ),
          ],
        ),
        verticalSpace(10),
        MyAppButton(
          onPressed: () {
            mybloc.changeTitle(widget.controller.text);
           BlocProvider.of<HomeCubit>(context).addTask(mybloc.state);

         

            context.pop();
          },
          mytext: 'اضافة مهمة',
        )
      ],
    );
  }
}

