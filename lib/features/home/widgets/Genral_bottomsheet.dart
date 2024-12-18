import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mohemti/core/helper/my_padding_ex.dart';
import 'package:mohemti/core/helper/route_extention.dart';
import 'package:mohemti/core/helper/sizedbox%20extention.dart';
import 'package:mohemti/core/routes/approutes.dart';
import 'package:mohemti/core/theme/colors.dart';
import 'package:mohemti/core/theme/text_style.dart';
import 'package:mohemti/core/widgets/have_acount_already.dart';
import 'package:mohemti/core/widgets/my_app_button.dart';
import 'package:mohemti/core/widgets/my_app_textfield.dart';
import 'package:mohemti/features/home/widgets/TaskDataContainor.dart';
import 'package:mohemti/features/home/widgets/my_bottomsheet.dart';
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
  String formattedDate = 'لا شيء';

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            'إضافة مهام جديدة',
            style: AppTextStyles.weight500size20black,
          ),
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
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  setState(() {
                    formattedDate = DateFormat("yyyy-MM-dd").format(pickedDate);
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
              SecText: 'لا شيء',
              imgSrc:
                  'Assets/icons/repeat 2.png', // Replace with your custom icon if needed
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => MyBottomSheet(
                          child: Tecrar_Bottomsheet(),
                        ));

                // Action for تكرار
              },
            ),
            TaskDataContainer(
              FirstText: 'تذكير',
              SecText: 'لا شيء',
              imgSrc:
                  'Assets/icons/alarm-clock.png', // Replace with your custom icon if needed
              onTap: () {},
            ),
          ],
        ),
        verticalSpace(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TaskDataContainer(
              FirstText: 'الأولوية',
              SecText: 'لا شيء',
              imgSrc: 'Assets/icons/flag 2.png',
              onTap: () {
                // Action for الأولوية
              },
            ),
            TaskDataContainer(
              FirstText: 'القسم',
              SecText: 'لا شيء',
              imgSrc:
                  'Assets/icons/element-equal.png', // Replace with your custom icon if needed
              onTap: () {
                // Action for القسم
              },
            ),
          ],
        ),
        verticalSpace(10),
        MyAppButton(
          onPressed: () {},
          mytext: 'اضافة مهمة',
        )
      ],
    );
  }
}

class Tecrar_Bottomsheet extends StatefulWidget {
  const Tecrar_Bottomsheet({super.key});

  @override
  State<Tecrar_Bottomsheet> createState() => _Tecrar_BottomsheetState();
}

class _Tecrar_BottomsheetState extends State<Tecrar_Bottomsheet> {
  bool ontap=false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => setState(() {
            ontap = !ontap;
          }),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            width: double.infinity,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'تكرار',
                    style: AppTextStyles.weight500size20black,
                  ),
                  Icon( ontap?
                  Icons.circle_rounded :  Icons.circle_outlined ,
                    color: (appcolors.secondaryColor),
                  )
                ]),
          ),
        )
      ],
    );
  }
}
