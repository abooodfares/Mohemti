import 'package:flutter/material.dart';
import 'package:mohemti/core/helper/route_extention.dart';
import 'package:mohemti/core/helper/sizedbox%20extention.dart';
import 'package:mohemti/core/routes/approutes.dart';
import 'package:mohemti/core/theme/text_style.dart';
import 'package:mohemti/core/widgets/have_acount_already.dart';
import 'package:mohemti/core/widgets/my_app_button.dart';
import 'package:mohemti/core/widgets/my_app_textfield.dart';
import 'package:mohemti/features/home/widgets/TaskDataContainor.dart';
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
              SecText: 'لا شيء',
              imgSrc:
                  'Assets/icons/calendar-2 1.png', // Replace with your custom icon if needed
              onTap: () {
 context.pushNamed(AppRoutes.calendar);
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
                // Action for تكرار
              },
            ),
            TaskDataContainer(
              FirstText: 'تذكير',
              SecText: 'لا شيء',
              imgSrc:
                  'Assets/icons/alarm-clock.png', // Replace with your custom icon if needed
              onTap: () {
               
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

class CalendarExample extends StatefulWidget {
  @override
  _CalendarExampleState createState() => _CalendarExampleState();
}

class _CalendarExampleState extends State<CalendarExample> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Calendar Example")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TableCalendar(
    
          firstDay: DateTime.utc(2000, 1, 1),
          lastDay: DateTime.utc(2100, 12, 31),
          focusedDay: _focusedDay,
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          },
          calendarFormat: CalendarFormat.month,
          startingDayOfWeek: StartingDayOfWeek.sunday,
        ),
      ),
    );
  }
}
